// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/statuses_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';

part 'board_screen_event.dart';
part 'board_screen_state.dart';

class BoardScreenBloc extends Bloc<BoardScreenEvent, BoardScreenState> {
  BoardScreenBloc({required this.boardsRepository})
      : super(const BoardScreenState()) {
    on<BoardStatusesFetched>(_fetchBoardStatuses);
    on<StatusPageChanged>((event, emit) =>
        emit(state.copyWith(currentIndex: event.currentIndex)));
    on<AddStatusButtonClicked>((event, emit) => emit(state.copyWith(
        addStatusTextBoxVisible: event.addStatusTextBoxVisible)));
    on<AddStatusNameChanged>(
        (event, emit) => emit(state.copyWith(statusName: event.statusName)));
    on<AddButtonClicked>(_addStatus);
    on<AddCardButtonClicked>((event, emit) => emit(state.copyWith(
        addCardNameTextBoxVisible: event.addCardNameTextBoxVisible,
        addCardNameSelectedIndex: event.addCardNameSelectedIndex)));
    on<AddCardNameTextChanged>(
        (event, emit) => emit(state.copyWith(cardName: event.cardName)));
    on<AddCardNameButtonClicked>(_addCardName);
    //on<StatusCardsFetched>(_fetchCardsOnStatus);
    on<CardIndexReordered>(_cardIndexReordered);
    on<CardMovedToOtherList>(_cardMovedToOtherList);
  }

  final BoardsRepository boardsRepository;

  Future<void> _fetchBoardStatuses(
    BoardStatusesFetched event,
    Emitter<BoardScreenState> emit,
  ) async {
    try {
      emit(state.copyWith(isFetchingStatuses: true));
      final statuses = await boardsRepository.getBoardStatuses(event.boardId!);
      emit(state.copyWith(statuses: statuses, isFetchingStatuses: false));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  // Future<void> _fetchCardsOnStatus(
  //   StatusCardsFetched event,
  //   Emitter<BoardScreenState> emit,
  // ) async {
  //   state.statuses.forEach((status)  async {
  //     final data = await boardsRepository.getStatusCards(event.boardId!, status.uid);
  //     return data;
  //   });
  // }

  Future<void> _addStatus(
    AddButtonClicked event,
    Emitter<BoardScreenState> emit,
  ) async {
    try {
      final status = StatusesModel(
          statusName: state.statusName, statusIndex: state.statuses.length + 1);
      final statusId = await boardsRepository.addBoardStatus(
        event.boardId!,
        status,
      );
      final newStatus = StatusesModel(
        uid: statusId,
        statusName: state.statusName!,
        cards: [],
      );

      state.statuses.add(newStatus);
      emit(state.copyWith(
        statusName: '',
        addStatusTextBoxVisible: false,
      ));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _addCardName(
    AddCardNameButtonClicked event,
    Emitter<BoardScreenState> emit,
  ) async {
    try {
      final card = CardsModel(
        cardName: state.cardName,
        description: '',
        startDate: null,
        dueDate: null,
        priority: null,
        cardIndex: state.statuses
                .where((e) => e.uid == event.statusId)
                .first
                .cards!
                .length +
            1,
      );
      final cardId = await boardsRepository.addCardName(
        event.boardId!,
        event.statusId!,
        card,
      );
      final addedCard =
          CardsModel(uid: cardId, cardName: state.cardName, description: '');
      final statuses = List<StatusesModel>.from(state.statuses);
      final cards = List<CardsModel>.from(
          statuses.where((e) => e.uid == event.statusId).first.cards!);
      cards.add(addedCard);
      statuses.where((e) => e.uid == event.statusId).first.cards = cards;
      emit(state.copyWith(
          cardName: '',
          addCardNameTextBoxVisible: false,
          statuses: statuses,
          cards: cards));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _cardIndexReordered(
    CardIndexReordered event,
    Emitter<BoardScreenState> emit,
  ) async {
    final statuses = List<StatusesModel>.from(state.statuses);
    final cards = List<CardsModel>.from(statuses[event.oldListIndex!].cards!);
    final oldList =
        state.statuses.where((e) => e.uid == event.statusId).first.cards;
    final card = cards.removeAt(event.oldIndex!);
    cards.insert(event.newIndex!, card);
    
    statuses[event.oldListIndex!].cards = cards;
    emit(state.copyWith(statuses: statuses, cards: cards));
    if (event.isGreater!) {
      for (int i = event.newIndex!;
          i < oldList!.length && i <= event.oldIndex!;
          i++) {
        await boardsRepository.updateCardIndex(
          event.boardId!,
          event.statusId!,
          oldList[i].uid!,
          i + 1,
        );
      }
    } else {
      for (int i = event.oldIndex!;
          i < oldList!.length && i <= event.newIndex!;
          i++) {
        await boardsRepository.updateCardIndex(
          event.boardId!,
          event.statusId!,
          oldList[i].uid!,
          i + 1,
        );
      }
    }
  }

  Future<void> _cardMovedToOtherList(
    CardMovedToOtherList event,
    Emitter<BoardScreenState> emit,
  ) async {
    final statuses = List<StatusesModel>.from(state.statuses);
    final newCards =
        List<CardsModel>.from(statuses[event.newListIndex!].cards!);
    final oldCards =
        List<CardsModel>.from(statuses[event.oldListIndex!].cards!);

    final card = oldCards.removeAt(event.oldIndex!);
    newCards.insert(newCards.length, card);
    statuses[event.oldListIndex!].cards = oldCards;
    statuses[event.newListIndex!].cards = newCards;
    emit(state.copyWith(statuses: statuses, cards: newCards));

    final movedCard = CardsModel(
        cardName: card.cardName,
        description: card.description,
        startDate: card.startDate,
        dueDate: card.dueDate,
        priority: card.priority,
        cardIndex: statuses[event.newListIndex!].cards!.length);

    await boardsRepository.moveCardToNewStatus(
        event.boardId!, statuses[event.newListIndex!].uid!, movedCard);
    await boardsRepository.deleteCardFromStatus(
        event.boardId!, statuses[event.oldListIndex!].uid!, card.uid!);
  }
}
