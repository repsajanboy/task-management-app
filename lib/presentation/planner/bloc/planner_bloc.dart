import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/appointment/appointment_model.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';

part 'planner_event.dart';
part 'planner_state.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc({required this.appointmentRepository, required this.context})
      : super(PlannerState()) {
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
    on<AppointmentOnTapped>((event, emit) => emit(state.copyWith(
          appointmentTitle: event.appointmentTitle,
          startDate: event.startDate,
          startTime: event.startTime,
          endDate: event.endDate,
          endTime: event.endTime,
          allDay: event.allDay,
          description: event.description,
          backgroundColor: event.backgroundColor,
          boardName: event.boardName,
        )));
    on<ResetStateValue>((event, emit) => emit(state.copyWith(
          appointmentTitle: '',
          startDate: DateTime.now(),
          startTime: DateTime.now(),
          endDate: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          allDay: false,
          description: '',
          backgroundColor: 4280391411,
          boardName: 'Select board',
        )));
    on<CreateAppointmentSaved>(_createAppointment);
    on<AppointmentsFetched>(_fetchAppointments);
  }

  final AppointmentRepository appointmentRepository;
  final BuildContext context;

  Future<void> _createAppointment(
    CreateAppointmentSaved event,
    Emitter<PlannerState> emit,
  ) async {
    final appointment = AppointmentModel(
      appointmentTitle: state.appointmentTitle,
      startDate: state.startDate,
      startTime: state.startTime,
      endDate: state.endDate,
      endTime: state.endTime,
      allDay: state.allDay,
      description: state.description,
      backgroundColor: state.backgroundColor,
      boardName: state.boardName,
    );

    await appointmentRepository.createAppointment(appointment);
  }

  Future<void> _fetchAppointments(
    AppointmentsFetched event,
    Emitter<PlannerState> emit,
  ) async {
    try {
      final appointments = await appointmentRepository.getAppointments();
      emit(state.copyWith(appointments: appointments));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
