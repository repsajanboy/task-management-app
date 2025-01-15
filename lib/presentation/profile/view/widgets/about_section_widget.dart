import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

Widget aboutSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          'About',
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
                  Icons.info_outline,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Help',
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
                  Icons.contact_support_outlined,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Contact Support',
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
                  Icons.lock_outline,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Privacy',
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
                  Icons.description_outlined,
                  color: AppColors.iconGreyColor,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Term of Service',
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
