import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/styles/colors.dart';

import 'widgets/add_card_widget.dart';
import 'widgets/add_status_widget.dart';

class BoardScreen extends StatelessWidget {
  BoardScreen({super.key, required this.board});

  final BoardsModel board;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BoardScreenBloc(boardsRepository: context.read<BoardsRepository>())
            ..add(BoardStatusesFetched(boardId: board.uid)),
      child: Scaffold(
        backgroundColor: Color(board.boardBackgroundColor!),
        appBar: AppBar(
          backgroundColor: AppColors.lightBlack.withOpacity(0.65),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: Text(
            board.boardTitle!,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: AppColors.mainTextColor,
            ),
          ),
          //Add action button in here
        ),
        body: _bodyScreenBody(),
      ),
    );
  }

  Widget _bodyScreenBody() {
    return BlocBuilder<BoardScreenBloc, BoardScreenState>(
      builder: (context, state) {
        final statuses = [...state.statuses, ""];
        return Container(
          margin: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: state.statuses.length + 1,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    if (index < state.statuses.length) {
                      return Container(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 4.0, right: 4.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.statuses[index].statusName!,
                                        style: const TextStyle(
                                            fontFamily: 'Chivo',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      const Icon(
                                        Icons.more_horiz_rounded,
                                        color: AppColors.mainTextColor,
                                      )
                                    ],
                                  ),
                                  state.statuses[index].cards!.length > 1
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state
                                              .statuses[index].cards!.length,
                                          itemBuilder: (BuildContext context,
                                              int cardIndex) {
                                            final cards =
                                                state.statuses[index].cards;
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 8.0,
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                                vertical: 5.0,
                                              ),
                                              decoration: const BoxDecoration(
                                                color: AppColors.lightBlack,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6.0)),
                                              ),
                                              child: Text(
                                                cards![cardIndex].cardName!,
                                                style: const TextStyle(
                                                  fontFamily: 'Chivo',
                                                  color:
                                                      AppColors.mainTextColor,
                                                ),
                                              ),
                                            );
                                          })
                                      : const SizedBox(height: 10),
                                  addCardWidget(
                                    index,
                                    board.uid!,
                                    state.statuses[index].uid!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return addStatusWidget(board.uid!);
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9,
                    disableCenter: true,
                    onPageChanged: (index, reason) {
                      context
                          .read<BoardScreenBloc>()
                          .add(StatusPageChanged(currentIndex: index));
                    },
                  ),
                ),
              ),
              BlocBuilder<BoardScreenBloc, BoardScreenState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: statuses.asMap().entries.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(
                              entry.key == state.currentIndex ? 1.0 : 0.4),
                        ),
                      );
                    }).toList(),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}