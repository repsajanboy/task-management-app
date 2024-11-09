part of 'create_board_bloc.dart';

sealed class CreateBoardEvent {}

class CreateBoardTitleChanged extends CreateBoardEvent {
  final String? boardTitle;

  CreateBoardTitleChanged({this.boardTitle});
}

class CreateBoardBackgroundColorSelected extends CreateBoardEvent {
  final String? boardBackgroundColor;
  final int? selectedBackgroundColorIndex;

  CreateBoardBackgroundColorSelected({
    this.boardBackgroundColor,
    this.selectedBackgroundColorIndex,
  });
}

class RemoveCreateBoardSelectedBackgroundColorIndex extends CreateBoardEvent {}

class CreateBoardSaved extends CreateBoardEvent {}
