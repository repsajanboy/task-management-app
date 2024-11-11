import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';
import 'package:task_management_app/networking/api/firebase_firestore_api.dart';

class BoardsRepository {
  final _firebaseFirestoreApi = FirebaseFirestoreApi();
  
  Future<void> createBoard(CraeteBoardModel board) async {
    await _firebaseFirestoreApi.createNewBoard(board);
  }

  Future<List<BoardsModel>> getBoards() async {
    final data = await _firebaseFirestoreApi.getBoards() as List;
    return data.map((e) {
      return BoardsModel.fromJson(e.id, e.data());
    }).toList();
  }
}