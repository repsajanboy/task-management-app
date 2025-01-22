import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/profile/view/widgets/about_section_widget.dart';
import 'package:task_management_app/presentation/profile/view/widgets/account_section_widget.dart';
import 'package:task_management_app/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightBlack,
        title: const Text(
          'janboym',
          style: TextStyle(
            fontFamily: 'Chivo',
            color: AppColors.mainTextColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .17,
              width: double.infinity,
              color: AppColors.lightBlack,
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blue,
                      child: Text(
                        "JM",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24.0,
                            color: AppColors.mainTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '@janboym',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'janboym@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            accountSection(),
            aboutSection(),
          ],
        ),
      ),
    );
  }
}
