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
  }

  final BoardsRepository boardsRepository;

  Future<void> _fetchBoardStatuses(
    BoardStatusesFetched event,
    Emitter<BoardScreenState> emit,
  ) async {
    try {
      final statuses = await boardsRepository.getBoardStatuses(event.boardId!);
      emit(state.copyWith(statuses: statuses));
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
      final addedCard = CardsModel(uid: cardId, cardName: state.cardName, description: '');
      state.statuses
          .where((element) => element.uid == event.statusId)
          .first
          .cards!
          .add(addedCard);
      emit(state.copyWith(cardName: '', addCardNameTextBoxVisible: false));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
