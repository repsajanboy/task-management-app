class CreateBoardModel {
  String? boardTitle;
  int? boardBackgroundColor;
  int? boardIndex;
  DateTime? boardCreatedDate;

  CreateBoardModel({
    this.boardTitle,
    this.boardBackgroundColor,
    this.boardIndex,
    this.boardCreatedDate,
  });

  Map<String, dynamic> toJson() => {
    'boardTitle': boardTitle,
    'boardBackgroundColor': boardBackgroundColor,
    'boardIndex': boardIndex,
  };
}