import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/data/models/boards/create_board_model.dart';
import 'package:task_management_app/data/models/boards/statuses_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/networking/api/firebase_firestore_api.dart';

class BoardsRepository {
  final _firebaseFirestoreApi = FirebaseFirestoreApi();

  Future<void> createBoard(CreateBoardModel board) async {
    await _firebaseFirestoreApi.createNewBoard(board);
  }

  Future<List<BoardsModel>> getBoards() async {
    final data = await _firebaseFirestoreApi.getBoards() as List;
    return data.map((e) {
      return BoardsModel.fromJson(e.id, e.data());
    }).toList();
  }

  Future<List<StatusesModel>> getBoardStatuses(String boardId) async {
    final data = await _firebaseFirestoreApi.getBoardStatuses(boardId) as List;
    final List<StatusesModel> statuses = [];
    for (int i = 0; i < data.length; i++) {
      final status = data[i].data();
      final cards = await _firebaseFirestoreApi.getStatusCards(
          boardId, data[i].id) as List;
      statuses.add(StatusesModel(
        uid: data[i].id,
        statusName: status['statusName'],
        statusIndex: status['cardIndex'],
        cards: cards.map((e) {
          return CardsModel.fromJson(e.id, e.data());
        }).toList(),
      ));
    }
    return statuses;
  }

  Future<dynamic> getStatusCards(String boardId, String statusId) async {
    final data =
        await _firebaseFirestoreApi.getStatusCards(boardId, statusId) as List;
    return data;
  }

  Future<String> addBoardStatus(String boardId, StatusesModel status) async {
    return await _firebaseFirestoreApi.addBoardStatus(boardId, status);
  }

  Future<String> addCardName(
    String boardId,
    String statusId,
    CardsModel card,
  ) async {
    return await _firebaseFirestoreApi.addCardName(boardId, statusId, card);
  }

  Future<void> updateCardDetails(String boardId, String statusId, CardsModel card) async {
    return await _firebaseFirestoreApi.updateCardDetails(boardId, statusId, card);
  }

  Future<void> updateCardIndex(String boardId, String statusId, String cardId, int newIndex) async {
    return await _firebaseFirestoreApi.updateCardIndex(boardId, statusId, cardId, newIndex);
  }

  Future<void> moveCardToNewStatus(String boardId, String newStatusId, CardsModel card) async {
    return await _firebaseFirestoreApi.moveCardToNewStatus(boardId, newStatusId, card);
  }

  Future<void> deleteCardFromStatus (String boardId, String statusId, String cardId) async {
    return await _firebaseFirestoreApi.deleteCardFromStatus(boardId, statusId, cardId);
  }
}
