part of 'planner_bloc.dart';

sealed class PlannerEvent {}

class AppointmentTitleChanged extends PlannerEvent {
  final String? title;
  AppointmentTitleChanged({this.title});
}

class AppointmentAllDaySwtichChanged extends PlannerEvent {
  final bool? allDay;
  AppointmentAllDaySwtichChanged({this.allDay});
}

class AppointmentStartDateChanged extends PlannerEvent {
  final DateTime? startDate;
  AppointmentStartDateChanged({this.startDate});
}

class AppointmentStartTimeChanged extends PlannerEvent {
  final DateTime? startTime;
  AppointmentStartTimeChanged({this.startTime});
}

class AppointmentEndDateChanged extends PlannerEvent {
  final DateTime? endDate;
  AppointmentEndDateChanged({this.endDate});
}

class AppointmentEndTimeChanged extends PlannerEvent {
  final DateTime? endTime;
  AppointmentEndTimeChanged({this.endTime});
}

class AppointmentBoardChanged extends PlannerEvent {
  final int? backgroundColor;
  final String? boardName;
  AppointmentBoardChanged({
    this.backgroundColor,
    this.boardName,
  });
}

class AppointmentDescriptionChanged extends PlannerEvent {
  final String? description;
  AppointmentDescriptionChanged({this.description});
}

class GetBoardsInBoardListBloc extends PlannerEvent {}

class CreateAppointmentSaved extends PlannerEvent {}

class AppointmentsFetched extends PlannerEvent {}

class AppointmentOnTapped extends PlannerEvent {
  final String? appointmentTitle;
  final DateTime? startDate;
  final DateTime? startTime;
  final DateTime? endDate;
  final DateTime? endTime;
  final bool? allDay;
  final String? description;
  final int? backgroundColor;
  final String? boardName;

  AppointmentOnTapped({
    this.appointmentTitle,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.allDay,
    this.description,
    this.backgroundColor,
    this.boardName,
  });
}

class ResetStateValue extends PlannerEvent {}
