import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/styles/colors.dart';

class BoardTitleWidget extends StatelessWidget {
  const BoardTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBoardBloc, CreateBoardState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Board title ',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.mainTextColor,
                    fontSize: 16.0),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            TextFormField(
              cursorColor: AppColors.mainCursorColor,
              autofocus: true,
              style: const TextStyle(
                fontFamily: "Chivo",
                color: AppColors.mainTextColor,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainBorderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainBorderColor),
                ),
              ),
              onChanged: (value) {
                context
                    .read<CreateBoardBloc>()
                    .add(CreateBoardTitleChanged(boardTitle: value));
              },
            ),
            if ((state.boardTitle ?? '').trim().isEmpty)
              RichText(
                text: const TextSpan(
                  text: '👋',
                  children: [
                    TextSpan(
                      text: 'Hi, board title is required',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              )
          ],
        );
      },
    );
  }
}
