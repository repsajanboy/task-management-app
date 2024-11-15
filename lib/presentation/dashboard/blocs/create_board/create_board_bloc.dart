import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';
import 'package:task_management_app/networking/repositories/boards_repository.dart';

part 'create_board_event.dart';
part 'create_board_state.dart';

class CreateBoardBloc extends Bloc<CreateBoardEvent, CreateBoardState> {
  CreateBoardBloc({required this.boardsRepository})
      : super(const CreateBoardState()) {
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

  Future<void> _createBoard(
    CreateBoardSaved event,
    Emitter<CreateBoardState> emit,
  ) async {
    final board = CraeteBoardModel(
      boardTitle: state.boardTitle,
      boardBackgroundColor: state.boardBackgroundColor,
    );

    await boardsRepository.createBoard(board);
    emit(state.copyWith(selectedBackgroundColorIndex: 99, boardTitle: ''));
  }
}
