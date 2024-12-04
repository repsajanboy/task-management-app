part of 'card_edit_bloc.dart';

sealed class CardEditEvent {}

class CardValueInitialized extends CardEditEvent {
  final CardsModel? card;
  CardValueInitialized({this.card});
}

class CardNameTextChanged extends CardEditEvent {
  final String? cardName;

  CardNameTextChanged({this.cardName});
}

class CardDescriptionTextChanged extends CardEditEvent {
  final String? description;

  CardDescriptionTextChanged({this.description});
}

class StartDateChanged extends CardEditEvent {
  final DateTime? startDate;

  StartDateChanged({this.startDate});
}

class DueDateChanged extends CardEditEvent {
  final DateTime? dueDate;

  DueDateChanged({this.dueDate});
}

class PrioritySelected extends CardEditEvent {
  final int? priorityIndex;

  PrioritySelected({this.priorityIndex});
}

class CardEditSaved extends CardEditEvent {
  final String? boardId;
  final String? statusId;

  CardEditSaved({this.boardId, this.statusId});
}
