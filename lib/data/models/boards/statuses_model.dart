import 'package:task_management_app/data/models/cards/cards_model.dart';

class StatusesModel {
  String? uid;
  String? statusName;
  List<CardsModel>? cards;

  StatusesModel({
    this.uid,
    this.statusName,
    this.cards
  });

  factory StatusesModel.fromJson(String id, Map<String, dynamic> json) =>
      StatusesModel(
        uid: id,
        statusName: json['statusName'] as String,
        cards: List<CardsModel>.from(json['cards'].map((x) => CardsModel.fromJson(x.id, x.json))),
      );
}
