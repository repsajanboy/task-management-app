import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/board_screen/board_screen.dart';
import 'package:task_management_app/styles/colors.dart';

Widget addStatusWidget(String boardId) {
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
                                context
                                    .read<BoardScreenBloc>()
                                    .add(AddStatusNameChanged(statusName: ''));
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
                              onPressed: (state.statusName ?? '').trim().isEmpty
                                  ? null
                                  : () {
                                      context.read<BoardScreenBloc>().add(
                                          AddButtonClicked(boardId: boardId));
                                    },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: (state.statusName ?? '').trim().isEmpty
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
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
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
                                  .add(AddStatusNameChanged(statusName: value));
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
