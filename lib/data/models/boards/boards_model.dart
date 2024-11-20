import 'package:cloud_firestore/cloud_firestore.dart';

class BoardsModel {
  String? uid;
  String? boardTitle;
  int? boardBackgroundColor;
  int? boardIndex;
  DateTime? boardCreatedDate;

  BoardsModel({
    this.uid,
    this.boardTitle,
    this.boardBackgroundColor,
    this.boardIndex,
    this.boardCreatedDate,
  });

  factory BoardsModel.fromJson(String id, Map<String, dynamic> json) =>
      BoardsModel(
        uid: id,
        boardTitle: json['boardTitle'] as String,
        boardBackgroundColor: json['boardBackgroundColor'] as int,
        boardIndex: json['boardIndex'],
        boardCreatedDate: json['boardCreatedDate'] == null ? null : (json['boardCreatedDate'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'boardTitle': boardTitle,
        'boardBackgroundColor': boardBackgroundColor,
        'boardIndex': boardIndex,
        'boardCreatedDate': DateTime.parse(boardCreatedDate!.toIso8601String()),
      };
}

