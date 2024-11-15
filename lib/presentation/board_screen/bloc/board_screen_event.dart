part of 'board_screen_bloc.dart';

sealed class BoardScreenEvent {}

class BoardStatusesFetched extends BoardScreenEvent {
  final String? boardId;

  BoardStatusesFetched({this.boardId});
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
