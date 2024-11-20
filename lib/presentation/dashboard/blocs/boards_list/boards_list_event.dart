part of 'boards_list_bloc.dart';

sealed class BoardsListEvent {}

class BoardsFetched extends BoardsListEvent {
  BoardsFetched();
}

class CreateBoardTitleChanged extends BoardsListEvent {
  final String? boardTitle;

  CreateBoardTitleChanged({this.boardTitle});
}

class CreateBoardBackgroundColorSelected extends BoardsListEvent {
  final int? boardBackgroundColor;
  final int? selectedBackgroundColorIndex;

  CreateBoardBackgroundColorSelected({
    this.boardBackgroundColor,
    this.selectedBackgroundColorIndex,
  });
}

class RemoveCreateBoardSelectedBackgroundColorIndex extends BoardsListEvent {}

class CreateBoardSaved extends BoardsListEvent {}