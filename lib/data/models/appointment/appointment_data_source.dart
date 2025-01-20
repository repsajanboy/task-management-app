import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_management_app/data/models/appointment/appointment_model.dart';

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<AppointmentModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].appointmentTitle;
  }

  @override
  Color getColor(int index) {
    return Color(appointments![index].backgroundColor);
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].allDay;
  }


}