part of 'boards_list_bloc.dart';

class BoardsListState extends Equatable {
  final List<BoardsModel> boards;
  final String? boardTitle;
  final int? boardBackgroundColor;
  final int? selectedBackgroundColorIndex;

  const BoardsListState({
    this.boards = const <BoardsModel>[],
    this.boardTitle,
    this.boardBackgroundColor,
    this.selectedBackgroundColorIndex,
  });

  BoardsListState copyWith({
    List<BoardsModel>? boards,
    String? boardTitle,
    int? boardBackgroundColor,
    int? selectedBackgroundColorIndex,
  }) {
    return BoardsListState(
      boards: boards ?? this.boards,
      boardTitle: boardTitle ?? this.boardTitle,
      boardBackgroundColor: boardBackgroundColor ?? this.boardBackgroundColor,
      selectedBackgroundColorIndex:
          selectedBackgroundColorIndex ?? this.selectedBackgroundColorIndex,
    );
  }

  @override
  List<Object?> get props => [
        boards,
        boardTitle,
        boardBackgroundColor,
        selectedBackgroundColorIndex,
      ];
}
