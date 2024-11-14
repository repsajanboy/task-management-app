class StatusesModel {
  String uid;
  String? statusName;

  StatusesModel({
    required this.uid,
    this.statusName,
  });

  factory StatusesModel.fromJson(String id, Map<String, dynamic> json) =>
      StatusesModel(
        uid: id,
        statusName: json['statusName'] as String,
      );
}
