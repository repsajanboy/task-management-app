import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_bloc.dart';
import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_item.dart';
import 'package:task_management_app/presentation/bottom_tab/bloc/bottom_tab_item_type.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/presentation/notification/notification.dart';
import 'package:task_management_app/presentation/planner/planner.dart';
import 'package:task_management_app/presentation/profile/profile.dart';
import 'package:task_management_app/styles/colors.dart';

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
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: state.currentIndex,
        children: items.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColors.lightBlack),
        child: BottomNavigationBar(
          backgroundColor: AppColors.lightBlack,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: state.currentIndex,
          onTap: (int index) {
            BlocProvider.of<BottomTabBloc>(context)
                .add(BottomTabChanged(index));
          },
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
          icon: const Icon(
            Icons.dashboard_outlined,
            color: AppColors.bottomNavItemColor,
          ),
          activeIcon: const Icon(
            Icons.dashboard,
            color: AppColors.bottomNavItemActiveColor,
          ),
        );
      case BottomTabItemType.planner:
        return BottomTabItem(
          page: const PlannerScreen(),
          title: '',
          icon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.bottomNavItemColor,
          ),
          activeIcon: const Icon(
            Icons.calendar_month,
            color: AppColors.bottomNavItemActiveColor,
          ),
        );
      case BottomTabItemType.notification:
        return BottomTabItem(
          page: const NotificationScreen(),
          title: '',
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColors.bottomNavItemColor,
          ),
          activeIcon: const Icon(
            Icons.notifications,
            color: AppColors.bottomNavItemActiveColor,
          ),
        );
      case BottomTabItemType.profile:
        return BottomTabItem(
          page: const ProfileScreen(),
          title: '',
          icon: const Icon(
            Icons.person_outline,
            color: AppColors.bottomNavItemColor,
          ),
          activeIcon: const Icon(
            Icons.person,
            color: AppColors.bottomNavItemActiveColor,
          ),
        );
      }
  }
}
