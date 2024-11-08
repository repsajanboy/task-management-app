class BoardsModel {
  String uid;
  String? boardTitle;
  String? boardBackgroundColor;

  BoardsModel({
    required this.uid,
    this.boardTitle,
    this.boardBackgroundColor,
  });

  Map<String, dynamic> toJson() => {
    "boardTitle": boardTitle,
    "boardBackgroundColor": boardBackgroundColor,
  };
}