import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentNotificationWidget extends StatelessWidget {
  const AppointmentNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                color: AppColors.iconGreyColor,
              ),
              SizedBox(width: 18.0),
              Text(
                '30 minutes before',
                style: TextStyle(
                  fontFamily: "Chivo",
                  fontSize: 16.0,
                  color: AppColors.mainTextColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.unfold_more_outlined,
              color: AppColors.iconGreyColor,
            ),
          )
        ],
      ),
    );
  }
}
