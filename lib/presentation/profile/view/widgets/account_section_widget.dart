import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

Widget accountSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          'Account',
          style: TextStyle(
            fontFamily: "Chivo",
            fontSize: 16.0,
            color: AppColors.mainTextColor,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: AppColors.lightBlack,
          border: Border(
            bottom: BorderSide(color: AppColors.mainBorderColor, width: .5),
            top: BorderSide(color: AppColors.mainBorderColor, width: .5),
          ),
        ),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Profile and visibility',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.mainBorderColor,
              indent: 32.0,
              thickness: .5,
            ),
            Row(
              children: [
                Icon(
                  Icons.subscriptions_outlined,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Subscription',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.mainBorderColor,
              indent: 32.0,
              thickness: .5,
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Switch Accounts',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.mainBorderColor,
              indent: 32.0,
              thickness: .5,
            ),
            Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
