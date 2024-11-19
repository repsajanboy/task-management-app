import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/styles/colors.dart';

Widget addCardWidget(int index, String boardId, String statusId) {
  return BlocBuilder<BoardScreenBloc, BoardScreenState>(
    builder: (context, state) {
      return Column(
        children: [
          Visibility(
            visible: !state.addCardNameTextBoxVisible,
            child: InkWell(
              onTap: () {
                context.read<BoardScreenBloc>().add(AddCardButtonClicked(
                    addCardNameTextBoxVisible: true,
                    addCardNameSelectedIndex: index));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.mainTextColor,
                    size: 18.0,
                  ),
                  Text(
                    'Add card',
                    style: TextStyle(
                      fontFamily: 'Chivo',
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: state.addCardNameTextBoxVisible &&
                state.addCardNameSelectedIndex == index,
            child: Column(
              children: [
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
                      context
                          .read<BoardScreenBloc>()
                          .add(AddCardNameTextChanged(cardName: value));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        context
                            .read<BoardScreenBloc>()
                            .add(AddCardNameTextChanged(cardName: ''));
                        context.read<BoardScreenBloc>().add(
                            AddCardButtonClicked(
                                addCardNameTextBoxVisible: false));
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    TextButton(
                      onPressed: (state.cardName ?? '').trim().isEmpty
                          ? null
                          : () {
                              context
                                  .read<BoardScreenBloc>()
                                  .add(AddCardNameButtonClicked(
                                    boardId: boardId,
                                    statusId: statusId,
                                  ));
                            },
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: (state.cardName ?? '').trim().isEmpty
                              ? Colors.white54
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
