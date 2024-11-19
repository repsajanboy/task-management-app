part of 'board_screen_bloc.dart';

sealed class BoardScreenEvent {}

class BoardStatusesFetched extends BoardScreenEvent {
  final String? boardId;

  BoardStatusesFetched({this.boardId});
}

class StatusCardsFetched extends BoardScreenEvent {
  final String? boardId;

  StatusCardsFetched({this.boardId});
}

class StatusPageChanged extends BoardScreenEvent {
  final int? currentIndex;

  StatusPageChanged({this.currentIndex});
}

class AddStatusButtonClicked extends BoardScreenEvent {
  final bool? addStatusTextBoxVisible;

  AddStatusButtonClicked({this.addStatusTextBoxVisible});
}

class AddStatusNameChanged extends BoardScreenEvent {
  final String? statusName;

  AddStatusNameChanged({this.statusName});
}

class AddButtonClicked extends BoardScreenEvent {
  final String? boardId;

  AddButtonClicked({this.boardId});
}

class AddCardButtonClicked extends BoardScreenEvent {
  final bool? addCardNameTextBoxVisible;
  final int? addCardNameSelectedIndex;

  AddCardButtonClicked({
    this.addCardNameTextBoxVisible,
    this.addCardNameSelectedIndex,
  });
}

class AddCardNameTextChanged extends BoardScreenEvent {
  final String? cardName;

  AddCardNameTextChanged({this.cardName});
}

class AddCardNameButtonClicked extends BoardScreenEvent {
  final String? boardId;
  final String? statusId;

  AddCardNameButtonClicked({
    this.boardId,
    this.statusId,
  });
}
