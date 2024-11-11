part of 'boards_list_bloc.dart';

sealed class BoardsListEvent {}

class BoardsFetched extends BoardsListEvent {
  BoardsFetched();
}
