part of 'board_screen_bloc.dart';

sealed class BoardScreenEvent {}

class BoardStatusesFetched extends BoardScreenEvent {
  final String? boardId;

  BoardStatusesFetched({this.boardId});
}
