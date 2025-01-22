import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class NotificationSampleScreen extends StatelessWidget {
  const NotificationSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _taskNotificationSection(),
        _appointmentNotificationSection(),
      ],
    );
  }

  Widget _taskNotificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: "Chivo",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all ...',
                style: TextStyle(
                  fontFamily: "Chivp",
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          color: AppColors.lightBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Swap card status ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'is due tomorrow.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '1h',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Badge(
                backgroundColor: Colors.blue,
                smallSize: 10.0,
                largeSize: 15.0,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Swap card status ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'is due tomorrow.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '1h',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Swap card status ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'is due tomorrow.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '1h',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ],
    );
  }

  Widget _appointmentNotificationSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Planner',
                style: TextStyle(
                  fontFamily: "Chivo",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all ...',
                style: TextStyle(
                  fontFamily: "Chivp",
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          color: AppColors.lightBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Planner feature ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'starts at 9:30 am.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '15m',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Badge(
                backgroundColor: Colors.blue,
                smallSize: 10.0,
                largeSize: 15.0,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Planner feature ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'starts at 9:30 am.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '15m',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffD29034),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Planner feature ',
                          style: TextStyle(
                              fontFamily: "Chivo",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'starts at 9:30 am.',
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ),
                      const Text(
                        '15m',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
