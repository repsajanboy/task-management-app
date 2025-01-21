import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/routing/app_router_names.dart';
import 'package:task_management_app/styles/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 64.0),
                    width: double.infinity,
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'assets/svg/landing.svg',
                      height: 350,
                      width: 300,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(
                      'Get the power to control and organize your tasks in different areas of your life',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Chivo",
                        color: Colors.lightBlue,
                        fontSize: 16.0
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                color: AppColors.background,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Text(
                      'GOTAMS',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainTextColor,
                        fontSize: 32.0,
                        letterSpacing: 5.0,
                      ),
                    ),
                    const Text(
                      '(Good Task Management System)',
                      style: TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.menu);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(8.0))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 24),
                            Icon(
                              Icons.trending_flat_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 30);
    path.quadraticBezierTo(size.width / 6, 0, size.width / 5 + 20, 20);
    path.quadraticBezierTo(
        size.width / 1.5, size.height / 3, size.width, size.height / 6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
