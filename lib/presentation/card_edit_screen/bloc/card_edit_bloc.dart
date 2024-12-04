import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';

part 'card_edit_event.dart';
part 'card_edit_state.dart';

class CardEditBloc extends Bloc<CardEditEvent, CardEditState> {
  CardEditBloc({required this.boardsRepository}) : super(const CardEditState()) {
    on<CardValueInitialized>(_initializedCardValue);
    on<CardNameTextChanged>((event, emit) => emit(state.copyWith(
          cardName: event.cardName,
          cardValuesChange: true,
        )));
    on<CardDescriptionTextChanged>((event, emit) => emit(state.copyWith(
          description: event.description,
          cardValuesChange: true,
        )));
    on<StartDateChanged>((event, emit) => emit(state.copyWith(
          startDate: event.startDate,
          cardValuesChange: true,
        )));
    on<DueDateChanged>((event, emit) => emit(state.copyWith(
          dueDate: event.dueDate,
          cardValuesChange: true,
        )));
    on<PrioritySelected>((event, emit) => emit(state.copyWith(
          priority: event.priorityIndex,
          priorityIndex: event.priorityIndex,
          cardValuesChange: true,
        )));
    on<CardEditSaved>(_cardEditSaved);
  }

  final BoardsRepository boardsRepository;
  
  Future<void> _initializedCardValue(
    CardValueInitialized event,
    Emitter<CardEditState> emit,
  ) async {
    emit(state.copyWith(
      uid: event.card?.uid,
      cardName: event.card?.cardName,
      description: event.card?.description,
      startDate: event.card?.startDate,
      dueDate: event.card?.dueDate,
      priority: event.card?.priority,
      cardIndex: event.card?.cardIndex,
    ));
  }

  Future<void> _cardEditSaved(
    CardEditSaved event,
    Emitter<CardEditState> emit,
  ) async {
    final card = CardsModel(
      uid: state.uid,
      cardName: state.cardName,
      description: state.description,
      startDate: state.startDate,
      dueDate: state.dueDate,
      priority: state.priority,
      cardIndex: state.cardIndex,
    );

    await boardsRepository.updateCardDetails(event.boardId!, event.statusId!, card);
  }
}
