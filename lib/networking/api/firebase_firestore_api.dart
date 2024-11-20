import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';
import 'package:task_management_app/data/models/boards/statuses_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';

class FirebaseFirestoreApi {
  final boardsReference = FirebaseFirestore.instance.collection('boards');

  Future<void> createNewBoard(CreateBoardModel boards) async {
    return await boardsReference.add(boards.toJson()).then((e) {
      e.update({'boardCreatedDate': FieldValue.serverTimestamp()});
    });
  }

  Future<dynamic> getBoards() async {
    QuerySnapshot snapshot =
        await boardsReference.orderBy('boardIndex', descending: false).get();
    return snapshot.docs;
  }

  Future<dynamic> getBoardStatuses(String boardId) async {
    QuerySnapshot snapshot = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .orderBy('statusIndex', descending: false)
        .get();
    return snapshot.docs;
  }

  Future<dynamic> getStatusCards(String boardId, String statusId) async {
    QuerySnapshot snapshot = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .doc(statusId)
        .collection('cards')
        .orderBy('cardIndex', descending: false)
        .get();
    return snapshot.docs;
  }

  Future<String> addBoardStatus(String boardId, StatusesModel status) async {
    final statusRef = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .add(status.toJson())
        .then((e) {
      e.update({
        'statusCreatedDate': FieldValue.serverTimestamp(),
      });
      return e;
    });

    return statusRef.id;
  }

  Future<String> addCardName(
      String boardId, String statusId, CardsModel card) async {
    final cardRef = await boardsReference
        .doc(boardId)
        .collection('statuses')
        .doc(statusId)
        .collection('cards')
        .add(card.toJson())
        .then((e) {
      e.update({'cardCreatedDate': FieldValue.serverTimestamp()});
      return e;
    });

    return cardRef.id;
  }
}
