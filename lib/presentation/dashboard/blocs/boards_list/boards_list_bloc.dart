
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';

part 'boards_list_event.dart';
part 'boards_list_state.dart';

class BoardsListBloc extends Bloc<BoardsListEvent, BoardsListState> {
  BoardsListBloc({required this.boardsRepository}) : super(const BoardsListState()) {
    on<BoardsFetched>(_fetchBoards);
    on<CreateBoardTitleChanged>(
        (event, emit) => emit(state.copyWith(boardTitle: event.boardTitle)));
    on<CreateBoardBackgroundColorSelected>((event, emit) => emit(state.copyWith(
        boardBackgroundColor: event.boardBackgroundColor,
        selectedBackgroundColorIndex: event.selectedBackgroundColorIndex)));
    on<RemoveCreateBoardSelectedBackgroundColorIndex>((event, emit) =>
        emit(state.copyWith(selectedBackgroundColorIndex: 99, boardTitle: '')));
    on<CreateBoardSaved>(_createBoard);
  }

  final BoardsRepository boardsRepository;

  Future<void> _fetchBoards (
    BoardsFetched event,
    Emitter<BoardsListState> emit
  ) async {
   try {
    final boards = await boardsRepository.getBoards();
    emit(state.copyWith(boards: boards));
   }
   on Exception catch (e) {
    print(e.toString());

   }
  }
  Future<void> _createBoard(
    CreateBoardSaved event,
    Emitter<BoardsListState> emit,
  ) async {
    final board = CreateBoardModel(
      boardTitle: state.boardTitle,
      boardBackgroundColor: state.boardBackgroundColor,
      boardIndex: state.boards.length + 1,
    );

    await boardsRepository.createBoard(board);
    emit(state.copyWith(selectedBackgroundColorIndex: 99, boardTitle: ''));
  }
}
