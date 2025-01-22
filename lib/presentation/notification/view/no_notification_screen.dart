import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class NoNotificationScreen extends StatelessWidget {
  const NoNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notifications_off_outlined,
          color: AppColors.iconGreyColor,
          size: 150,
        ),
        SizedBox(height: 24.0),
        Text(
          'You have no notifications',
          style: TextStyle(
            fontFamily: "Chivo",
            color: AppColors.mainTextColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        )
      ],
    );
  }
}
