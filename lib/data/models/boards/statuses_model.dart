import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';

class StatusesModel {
  String? uid;
  String? statusName;
  int? statusIndex;
  DateTime? statusCreatedDate;
  List<CardsModel>? cards;

  StatusesModel(
      {this.uid,
      this.statusName,
      this.statusIndex,
      this.statusCreatedDate,
      this.cards});

  factory StatusesModel.fromJson(String id, Map<String, dynamic> json) =>
      StatusesModel(
        uid: id,
        statusName: json['statusName'] as String,
        statusIndex: json['statusIndex'] as int,
        statusCreatedDate: json['statusCreatedDate'] == null
            ? null
            : (json['statusCreatedDate'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'statusName': statusName,
        'statusIndex': statusIndex,
        'statusCreatedDate': statusCreatedDate,
      };
}
