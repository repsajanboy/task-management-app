import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

Widget cardMoveArchiveWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
    decoration: const BoxDecoration(color: AppColors.lightBlack),
    child: const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Move Card',
              style: TextStyle(
                fontFamily: "Chivo",
                color: AppColors.greyTextColor,
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconGreyColor,
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Divider(
          thickness: 0.3,
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Copy Card',
              style: TextStyle(
                fontFamily: "Chivo",
                color: AppColors.greyTextColor,
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconGreyColor,
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Divider(
          thickness: 0.3,
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Archive Card',
              style: TextStyle(
                fontFamily: "Chivo",
                color: AppColors.greyTextColor,
                fontSize: 16.0,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconGreyColor,
            ),
          ],
        ),
      ],
    ),
  );
}
