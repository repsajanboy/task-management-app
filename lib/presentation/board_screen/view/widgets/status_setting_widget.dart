import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class StatusSettingWidget extends StatelessWidget {
  const StatusSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                  topRight: Radius.circular(28.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        AppColors.greyTextColor,
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  const Text(
                    'Status Setting',
                    style: TextStyle(
                      fontFamily: "Chivo",
                      color: AppColors.mainTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Visibility(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Save',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: const BoxDecoration(color: AppColors.lightBlack),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Status Name'),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(
                      initialValue: 'Backlog',
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: const BoxDecoration(color: AppColors.lightBlack),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        'Copy List',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.iconGreyColor,
                      ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        'Move List',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.iconGreyColor,
                      ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        'Sort List',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.iconGreyColor,
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                decoration: const BoxDecoration(color: AppColors.lightBlack),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Archive this list',
                      style: TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.iconGreyColor,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
