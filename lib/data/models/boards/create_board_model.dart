class CraeteBoardModel {
  String? boardTitle;
  String? boardBackgroundColor;

  CraeteBoardModel({
    this.boardTitle,
    this.boardBackgroundColor,
  });

  Map<String, dynamic> toJson() => {
    "boardTitle": boardTitle,
    "boardBackgroundColor": boardBackgroundColor,
  };
}