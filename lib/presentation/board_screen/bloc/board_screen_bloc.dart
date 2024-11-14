import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/statuses_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';

part 'board_screen_event.dart';
part 'board_screen_state.dart';

class BoardScreenBloc extends Bloc<BoardScreenEvent, BoardScreenState> {
  BoardScreenBloc({required this.boardsRepository}) : super(const BoardScreenState()) {
    on<BoardStatusesFetched>(_fetchBoardStatuses);
  }

  final BoardsRepository boardsRepository;

  Future<void> _fetchBoardStatuses(
    BoardStatusesFetched event,
    Emitter<BoardScreenState> emit,
  )  async {
    try {
    final statuses = await boardsRepository.getBoardStatuses(event.boardId!);
    emit(state.copyWith(statuses: statuses));
   }
   on Exception catch (e) {
    print(e.toString());

   }
  }
}
