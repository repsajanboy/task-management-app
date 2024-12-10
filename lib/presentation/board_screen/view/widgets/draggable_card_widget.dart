import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/cards/card_priority_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/routing/app_router_names.dart';
import 'package:task_management_app/styles/colors.dart';

Widget draggableCardWidget(BuildContext context, String boardId,
    String statusId, List<CardsModel> cards) {
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
    child: ReorderableListView.builder(
      shrinkWrap: true,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int cardIndex) {
        return InkWell(
          key: Key('$cardIndex'),
          onTap: () async {
            final arguments = {
              'card': cards[cardIndex],
              'boardId': boardId,
              'statusId': statusId,
            };
            final isSaved = await Navigator.pushNamed(
              context,
              RouteNames.editCard,
              arguments: arguments,
            );
            if (isSaved == true) {
              if (!context.mounted) return;
              BlocProvider.of<BoardScreenBloc>(context)
                  .add(BoardStatusesFetched(boardId: boardId));
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            decoration: const BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cards[cardIndex].cardName!,
                  style: const TextStyle(
                    fontFamily: 'Chivo',
                    color: AppColors.mainTextColor,
                  ),
                ),
                Visibility(
                  visible: cards[cardIndex].priority != null,
                  child: cards[cardIndex].priority != null
                      ? cardPriorityList[cards[cardIndex].priority! - 1].icon!
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        bool isGreater = true;
        if (oldIndex < newIndex) {
          newIndex -= 1;
          isGreater = false;
        }
        BlocProvider.of<BoardScreenBloc>(context).add(CardIndexReordered(
          oldIndex: oldIndex,
          newIndex: newIndex,
          boardId: boardId,
          statusId: statusId,
          isGreater: isGreater,
        ));
      },
    ),
  );
}
