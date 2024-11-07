import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class BoardTitleWidget extends StatelessWidget {
  const BoardTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Board title ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: AppColors.mainTextColor,
            ),
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
          cursorColor: AppColors.mainTextColor,
          style: const TextStyle(
            fontFamily: "Chivo",
            color: AppColors.mainTextColor,
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainTextColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainTextColor),
            ),
          ),
        ),
        const SizedBox(), //validation text space
      ],
    );
  }
}
