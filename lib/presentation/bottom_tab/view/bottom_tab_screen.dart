import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_bloc.dart';
import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_item.dart';
import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_item_type.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/presentation/notification/notification.dart';
import 'package:task_management_app/presentation/planner/planner.dart';
import 'package:task_management_app/presentation/profile/profile.dart';

class BottomNavBarScreen extends StatefulWidget {
  final int currIndex;
  const BottomNavBarScreen({super.key, required this.currIndex});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BottomTabBloc()..add(InitialBottomTab(widget.currIndex)),
        ),
      ],
      child: BlocBuilder<BottomTabBloc, BottomTabState>(
        builder: (context, state) {
          if (state is CreateBottomTab) {
            return _buildTab(context, state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildTab(BuildContext context, CreateBottomTab state) {
    final items = state.items.map((type) => _getItem(type));
    return Scaffold(
      body: IndexedStack(
        index: state.currentIndex,
        children: items.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: items
              .map((e) => BottomNavigationBarItem(
                  icon: e.icon, label: e.title, activeIcon: e.activeIcon))
              .toList(),
        ),
      ),
    );
  }

  BottomTabItem _getItem(BottomTabItemType type) {
    switch (type) {
      case BottomTabItemType.dashboard:
        return BottomTabItem(
          page: const DashboardScreen(),
          title: '',
          icon: const Icon(Icons.dashboard),
          activeIcon: const Icon(Icons.dashboard),
        );
      case BottomTabItemType.planner:
        return BottomTabItem(
          page: const PlannerScreen(),
          title: '',
          icon: const Icon(Icons.calendar_month),
          activeIcon: const Icon(Icons.calendar_month),
        );
      case BottomTabItemType.notification:
        return BottomTabItem(
          page: const NotificationScreen(),
          title: '',
          icon: const Icon(Icons.notifications),
          activeIcon: const Icon(Icons.notifications),
        );
      case BottomTabItemType.profile:
        return BottomTabItem(
          page: const ProfileScreen(),
          title: '',
          icon: const Icon(Icons.person),
          activeIcon: const Icon(Icons.person),
        );
      default:
        return BottomTabItem(
          page: const SizedBox(),
          title: '',
          icon: const SizedBox(),
          activeIcon: const SizedBox(),
        );
    }
  }
}
