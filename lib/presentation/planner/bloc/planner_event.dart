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
