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
}
