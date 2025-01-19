import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';

part 'planner_event.dart';
part 'planner_state.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc(BuildContext context) : super(PlannerState()) {
    on<AppointmentTitleChanged>(
      (event, emit) => emit(state.copyWith(appointmentTitle: event.title)),
    );
    on<AppointmentAllDaySwtichChanged>(
      (event, emit) => emit(state.copyWith(allDay: event.allDay)),
    );
    on<AppointmentStartDateChanged>(
      (event, emit) => emit(state.copyWith(startDate: event.startDate)),
    );
    on<AppointmentStartTimeChanged>(
      (event, emit) => emit(state.copyWith(startTime: event.startTime)),
    );
    on<AppointmentEndDateChanged>(
      (event, emit) => emit(state.copyWith(endDate: event.endDate)),
    );
    on<AppointmentEndTimeChanged>(
      (event, emit) => emit(state.copyWith(endTime: event.endTime)),
    );
    on<AppointmentBoardChanged>(
      (event, emit) => emit(state.copyWith(
        backgroundColor: event.backgroundColor,
        boardName: event.boardName,
      )),
    );
    on<AppointmentDescriptionChanged>(
      (event, emit) => emit(state.copyWith(description: event.description)),
    );
    on<GetBoardsInBoardListBloc>(
      (event, emit) => emit(
          state.copyWith(boards: context.read<BoardsListBloc>().state.boards)),
    );
  }
}
