import 'package:flutter/material.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';

import 'package:task_management_app/presentation/bottom_tab/bottom_tab.dart';
import 'package:task_management_app/presentation/card_edit_screen/card_edit.dart';
import 'package:task_management_app/routing/app_router_names.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.menu:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarScreen(
            currIndex: 0,
          ),
        );
      case RouteNames.board:
        final board = routeSettings.arguments as BoardsModel;
        return MaterialPageRoute(
          builder: (_) => BoardScreen(
            board: board,
          ),
        );
      case RouteNames.editCard:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final card = args['card'] as CardsModel;
        final boardId = args['boardId'] as String;
        final statusId = args['statusId'] as String;
        return MaterialPageRoute(
          builder: (_) => CardEditScreen(
            card: card,
            boardId: boardId,
            statusId: statusId,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route define for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
