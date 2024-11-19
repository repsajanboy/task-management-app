import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';

class FirebaseFirestoreApi {
  final boardsReference = FirebaseFirestore.instance.collection('boards');

  Future<void> createNewBoard(CraeteBoardModel boards) async {
    return await boardsReference.doc().set(boards.toJson());
  }

  Future<dynamic> getBoards() async {
    QuerySnapshot snapshot = await boardsReference.get();
    return snapshot.docs;
  }

  Future<dynamic> getBoardStatuses(String boardId) async {
    QuerySnapshot snapshot =
        await boardsReference.doc(boardId).collection('statuses').get();
    return snapshot.docs;
  }

  Future<dynamic> getStatusCards(String boardId, String statusId) async {
    QuerySnapshot snapshot = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .doc(statusId)
        .collection('cards')
        .get();
    return snapshot.docs;
  }

  Future<String> addBoardStatus(String boardId, String statusName) async {
    final data = {"statusName": statusName};
    final statusRef =  await boardsReference
        .doc(boardId)
        .collection('statuses')
        .add(data);

    return statusRef.id;
  }

  Future<String> addCardName(
      String boardId, String statusId, String cardName) async {
    final data = {"cardName": cardName};
    final cardRef = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .doc(statusId)
        .collection('cards')
        .add(data);

    return cardRef.id;
  }
}
