class CraeteBoardModel {
  String? boardTitle;
  int? boardBackgroundColor;

  CraeteBoardModel({
    this.boardTitle,
    this.boardBackgroundColor,
  });

  Map<String, dynamic> toJson() => {
    "boardTitle": boardTitle,
    "boardBackgroundColor": boardBackgroundColor,
  };
}