import 'package:cloud_firestore/cloud_firestore.dart';

class CardsModel {
  String? uid;
  String? cardName;
  String? description;
  DateTime? startDate;
  DateTime? dueDate;
  int? priority;
  int? cardIndex;
  DateTime? cardCreatedDate;

  CardsModel({
    this.uid,
    this.cardName,
    this.description,
    this.startDate,
    this.dueDate,
    this.priority,
    this.cardIndex,
    this.cardCreatedDate,
  });

  factory CardsModel.fromJson(String id, Map<String, dynamic> json) =>
      CardsModel(
        uid: id,
        cardName: json['cardName'] as String,
        description: json['description'] as String,
        startDate: json['startDate'] == null
            ? null
            : (json['startDate'] as Timestamp).toDate(),
        dueDate: json['dueDate'] == null
            ? null
            : (json['dueDate'] as Timestamp).toDate(),
        priority: json['priority'] == null ? null : json['priority'] as int,
        cardIndex: json['cardIndex'] as int,
        cardCreatedDate: (json['cardCreatedDate'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'cardName': cardName,
        'description': description,
        'startDate': startDate,
        'dueDate': dueDate,
        'priority': priority,
        'cardIndex': cardIndex,
      };
}