import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/boards/boards_model.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/styles/colors.dart';
import 'package:task_management_app/utils/board_background_colors.dart';

class BoardSettingWidget extends StatelessWidget {
  const BoardSettingWidget({super.key, required this.board});

  final BoardsModel board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * .90,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 28.0,
                        color: AppColors.iconGreyColor,
                      ),
                    ),
                    const Text(
                      'Board settings',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Board Name',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      BlocBuilder<BoardScreenBloc, BoardScreenState>(
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: board.boardTitle,
                            cursorColor: AppColors.mainCursorColor,
                            style:
                                const TextStyle(color: AppColors.mainTextColor),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      BlocBuilder<BoardScreenBloc, BoardScreenState>(
                        builder: (context, state) {
                          return TextFormField(
                            maxLines: 5,
                            cursorColor: AppColors.mainCursorColor,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Add brief description on what you are managing and what will be the use for this board.',
                                hintStyle: TextStyle(color: Colors.white54)),
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white24,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Background',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Color(board.boardBackgroundColor!),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          MenuAnchor(
                            builder: (
                              BuildContext context,
                              MenuController controller,
                              Widget? child,
                            ) {
                              return IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (controller.isOpen) {
                                    controller.close();
                                  } else {
                                    controller.open();
                                  }
                                },
                                icon: const Icon(
                                  Icons.unfold_more_outlined,
                                  color: AppColors.iconGreyColor,
                                ),
                              );
                            },
                            style: const MenuStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    AppColors.background),
                                elevation: WidgetStatePropertyAll(5.0)),
                            menuChildren: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .50,
                                child: Wrap(
                                  children: boardBackgroundColors.map((e) {
                                    return Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(e.value),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Archive',
                    style: TextStyle(
                      fontFamily: "Chivo",
                      color: AppColors.greyTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.iconGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Close Board',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
