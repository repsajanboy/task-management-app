class BoardsModel {
  String? uid;
  String? boardTitle;
  int? boardBackgroundColor;

  BoardsModel({
    this.uid,
    this.boardTitle,
    this.boardBackgroundColor,
  });

  factory BoardsModel.fromJson(String id, Map<String, dynamic> json) =>
      BoardsModel(
        uid: id,
        boardTitle: json['boardTitle'] as String,
        boardBackgroundColor: json['boardBackgroundColor'] as int,
      );

  Map<String, dynamic> toJson() => {
        "boardTitle": boardTitle,
        "boardBackgroundColor": boardBackgroundColor,
      };
}

