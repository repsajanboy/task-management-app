import 'package:flutter/material.dart';
import 'package:task_management_app/routing/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}