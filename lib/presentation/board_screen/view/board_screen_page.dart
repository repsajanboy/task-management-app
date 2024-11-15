import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/styles/colors.dart';

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
                                          color: AppColors.mainTextColor,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.more_horiz_rounded,
                                        color: AppColors.mainTextColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return addStatusWidget();
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

  Widget addStatusWidget() {
    return BlocBuilder<BoardScreenBloc, BoardScreenState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: state.addStatusTextBoxVisible
                      ? Colors.black
                      : AppColors.lightBlack.withOpacity(.50),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Visibility(
                      visible: !state.addStatusTextBoxVisible,
                      child: TextButton(
                        onPressed: () {
                          context.read<BoardScreenBloc>().add(
                              AddStatusButtonClicked(
                                  addStatusTextBoxVisible: true));
                        },
                        child: const Text(
                          'Add status',
                          style: TextStyle(
                            fontFamily: 'Chivo',
                            color: AppColors.mainTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.addStatusTextBoxVisible,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.read<BoardScreenBloc>().add(AddStatusNameChanged(statusName: ''));
                                  context.read<BoardScreenBloc>().add(
                                      AddStatusButtonClicked(
                                          addStatusTextBoxVisible: false));
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed:
                                    (state.statusName ?? '').trim().isEmpty
                                        ? null
                                        : () {
                                          context.read<BoardScreenBloc>().add(AddButtonClicked(boardId: board.uid));
                                        },
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    color:
                                        (state.statusName ?? '').trim().isEmpty
                                            ? Colors.white30
                                            : Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              autofocus: true,
                              cursorColor: AppColors.mainCursorColor,
                              style: const TextStyle(
                                fontFamily: 'Chivo',
                                color: AppColors.mainTextColor,
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.mainBorderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.mainBorderColor,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                context.read<BoardScreenBloc>().add(
                                    AddStatusNameChanged(statusName: value));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
