part of 'boards_list_bloc.dart';

class BoardsListState extends Equatable {
  final List<BoardsModel> boards;

  const BoardsListState({
    this.boards = const <BoardsModel>[],
  });

  BoardsListState copyWith({
    List<BoardsModel>? boards,
  }) {
    return BoardsListState(
      boards: boards ?? this.boards,
    );
  }

  @override
  List<Object> get props => [boards];
}
