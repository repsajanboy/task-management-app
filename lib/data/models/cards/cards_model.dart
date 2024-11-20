import 'package:cloud_firestore/cloud_firestore.dart';

class CardsModel {
  String? uid;
  String? cardName;
  String? description;
  int? cardIndex;
  DateTime? cardCreatedDate;

  CardsModel({
    this.uid,
    this.cardName,
    this.description,
    this.cardIndex,
    this.cardCreatedDate,
  });

  factory CardsModel.fromJson(String id, Map<String, dynamic> json) =>
      CardsModel(
        uid: id,
        cardName: json['cardName'] as String,
        description: json['description'] as String,
        cardIndex: json['cardIndex'] as int,
        cardCreatedDate: (json['cardCreatedDate'] as Timestamp).toDate(),
      );
  
  Map<String, dynamic> toJson() => {
    'cardName': cardName,
    'description': description,
    'cardIndex': cardIndex,
  };
}
