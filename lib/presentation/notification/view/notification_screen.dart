import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/notification/view/no_notification_screen.dart';
import 'package:task_management_app/presentation/notification/view/notification_sample_screen.dart';
import 'package:task_management_app/styles/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightBlack,
        titleSpacing: 24.0,
        centerTitle: false,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: "Montserrat",
            color: AppColors.mainTextColor
          ),
        ),
      ),
      body: const SafeArea(
        child: NotificationSampleScreen(),
      ),
    );
  }
}
