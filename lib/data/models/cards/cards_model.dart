class CardsModel {
  String? uid;
  String? cardName;

  CardsModel({
    this.uid,
    this.cardName,
  });

  factory CardsModel.fromJson(String id, Map<String, dynamic> json) =>
      CardsModel(
        uid: id,
        cardName: json['cardName'] as String,
      );
}
