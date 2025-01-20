import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String? uid;
  String? appointmentTitle;
  DateTime? startDate;
  DateTime? startTime;
  DateTime? endDate;
  DateTime? endTime;
  bool? allDay;
  String? description;
  int? backgroundColor;
  String? boardName;
  DateTime? appointmentCreatedDate;

  AppointmentModel({
    this.uid,
    this.appointmentTitle,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.allDay,
    this.description,
    this.backgroundColor,
    this.boardName,
    this.appointmentCreatedDate,
  });

  factory AppointmentModel.fromJson(String id, Map<String, dynamic> json) =>
      AppointmentModel(
        uid: id,
        appointmentTitle: json['appointmentTitle'] as String,
        startDate: json['startDate'] == null
            ? null
            : (json['startDate'] as Timestamp).toDate(),
        startTime: json['startTime'] == null
            ? null
            : (json['startTime'] as Timestamp).toDate(),
        endDate: json['endDate'] == null
            ? null
            : (json['endDate'] as Timestamp).toDate(),
        endTime: json['endTime'] == null
            ? null
            : (json['endTime'] as Timestamp).toDate(),
        allDay: json['allDay'] as bool,
        description: json['description'] == null ? '' :json['description'] as String,
        backgroundColor: json['backgroundColor'] as int,
        boardName: json['boardName'] as String,
        appointmentCreatedDate: json['appointmentCreatedDate'] == null
            ? null
            : (json['appointmentCreatedDate'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'appointmentTitle': appointmentTitle,
        'startDate': startDate,
        'startTime': startTime,
        'endDate': endDate,
        'endTime': endTime,
        'allDay': allDay,
        'description': description,
        'backgroundColor': backgroundColor,
        'boardName': boardName,
      };
}
