import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/data/models/boards/statuses_model.dart';
import 'package:task_management_app/data/models/cards/card_priority_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/routing/app_router_names.dart';
import 'package:task_management_app/styles/colors.dart';

import 'widgets/add_card_widget.dart';
import 'widgets/add_status_widget.dart';
import 'widgets/board_setting_widget.dart';
import 'widgets/status_setting_widget.dart';

class BoardScreen extends StatelessWidget {
  BoardScreen({super.key, required this.board});

  final BoardsModel board;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BoardScreenBloc(boardsRepository: context.read<BoardsRepository>())
            ..add(BoardStatusesFetched(boardId: board.uid)),
      child: Scaffold(
        backgroundColor: Color(board.boardBackgroundColor!),
        appBar: AppBar(
          backgroundColor: AppColors.lightBlack.withValues(alpha: 0.65),
          leading: const BackButton(
            color: AppColors.mainTextColor,
          ),
          title: Text(
            board.boardTitle!,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: AppColors.mainTextColor,
            ),
          ),
          //Add action button in here
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return BoardSettingWidget(board: board);
                    });
              },
              icon: const Icon(
                Icons.settings,
                color: AppColors.mainTextColor,
              ),
            )
          ],
        ),
        body: _bodyScreenBody(),
      ),
    );
  }

  Widget _bodyScreenBody() {
    return BlocBuilder<BoardScreenBloc, BoardScreenState>(
      buildWhen: (previous, current) => previous.statuses != current.statuses,
      builder: (context, state) {
        final statuses = [...state.statuses, ""];
        if (state.isFetchingStatuses!) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
            child: DragAndDropLists(
              onItemReorder: (
                int oldItemIndex,
                int oldListIndex,
                int newItemIndex,
                int newListIndex,
              ) {
                if (oldListIndex == newListIndex) {
                  bool isGreater = true;
                  if (oldItemIndex == newItemIndex) {
                    return;
                  } else if (oldItemIndex < newItemIndex) {
                    isGreater = false;

                    context.read<BoardScreenBloc>().add(CardIndexReordered(
                          oldIndex: oldItemIndex,
                          newIndex: newItemIndex,
                          boardId: board.uid,
                          statusId: state.statuses[oldListIndex].uid,
                          isGreater: isGreater,
                          oldListIndex: oldListIndex,
                        ));
                  } else {
                    context.read<BoardScreenBloc>().add(CardIndexReordered(
                          oldIndex: oldItemIndex,
                          newIndex: newItemIndex,
                          boardId: board.uid,
                          statusId: state.statuses[oldListIndex].uid,
                          isGreater: isGreater,
                          oldListIndex: oldListIndex,
                        ));
                  }
                } else {
                  context.read<BoardScreenBloc>().add(CardMovedToOtherList(
                        oldListIndex: oldListIndex,
                        newListIndex: newListIndex,
                        oldIndex: oldItemIndex,
                        boardId: board.uid,
                      ));
                }
              },
              onListReorder: _onListReorder,
              axis: Axis.horizontal,
              listWidth: MediaQuery.of(context).size.width * .90,
              listPadding: const EdgeInsets.all(12.0),
              children: List.generate(
                statuses.length,
                (index) => _buildStatusList(context, index, state.statuses),
              ),
              contentsWhenEmpty: addStatusWidget(board.uid!),
              scrollController: _controller,
            ),
          );
        }
      },
    );
  }

  _buildStatusList(
      BuildContext context, int statusIndex, List<StatusesModel> statuses) {
    if (statusIndex < statuses.length) {
      var statusList = statuses[statusIndex];
      return DragAndDropList(
        canDrag: false,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statusList.statusName!,
                style: const TextStyle(
                    fontFamily: 'Chivo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const StatusSettingWidget();
                      });
                },
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.mainTextColor,
                ),
              )
            ],
          ),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
          child: addCardWidget(statusIndex, board.uid!, statusList.uid!),
        ),
        children: List.generate(
          statusList.cards!.length,
          (cardIndex) => _buildCard(
              context, statusList.cards![cardIndex], statusList.uid!),
        ),
        contentsWhenEmpty: const SizedBox(),
      );
    }
    return DragAndDropList(
      children: List.empty(),
      contentsWhenEmpty: Container(
        child: addStatusWidget(board.uid!),
      ),
    );
  }

  _buildCard(BuildContext context, CardsModel card, String statusId) {
    return DragAndDropItem(
      child: InkWell(
        onTap: () async {
          final arguments = {
            'card': card,
            'boardId': board.uid,
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
                .add(BoardStatusesFetched(boardId: board.uid));
          }
        },
        child: Container(
          width: double.infinity,
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
                card.cardName!,
                style: const TextStyle(
                  fontFamily: 'Chivo',
                  color: AppColors.mainTextColor,
                ),
              ),
              Visibility(
                visible: card.priority != null,
                child: card.priority != null
                    ? cardPriorityList[card.priority! - 1].icon!
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    // setState(() {
    //   var movedList = _lists.removeAt(oldListIndex);
    //   _lists.insert(newListIndex, movedList);
    // });
  }
}
