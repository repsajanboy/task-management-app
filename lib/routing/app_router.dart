import 'package:flutter/material.dart';

import 'package:task_management_app/presentation/bottom_tab/bottom_tab.dart';
import 'package:task_management_app/routing/app_router_names.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.menu:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route define for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
