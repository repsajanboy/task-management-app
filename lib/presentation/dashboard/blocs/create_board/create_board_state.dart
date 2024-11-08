part of 'create_board_bloc.dart';

class CreateBoardState extends Equatable {
  final String? boardTitle;
  final String? boardBackgroundColor;
  final int? selectedBackgroundColorIndex;

  const CreateBoardState({
    this.boardTitle,
    this.boardBackgroundColor,
    this.selectedBackgroundColorIndex,
  });

  CreateBoardState copyWith({
    String? boardTitle,
    String? boardBackgroundColor,
    int? selectedBackgroundColorIndex,
  }) {
    return CreateBoardState(
      boardTitle: boardTitle ?? this.boardTitle,
      boardBackgroundColor: boardBackgroundColor ?? this.boardBackgroundColor,
      selectedBackgroundColorIndex: selectedBackgroundColorIndex ?? this.selectedBackgroundColorIndex,
    );
  }

  @override
  List<Object?> get props => [
        boardTitle,
        boardBackgroundColor,
        selectedBackgroundColorIndex,
      ];
}
