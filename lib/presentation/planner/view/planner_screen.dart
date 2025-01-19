import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_management_app/presentation/planner/view/widget/appointment_board_widget.dart';
import 'package:task_management_app/presentation/planner/view/widget/appointment_description_widget.dart';
import 'package:task_management_app/presentation/planner/view/widget/appointment_notification_widget.dart';
import 'package:task_management_app/presentation/planner/view/widget/appointment_time_widget.dart';
import 'package:task_management_app/presentation/planner/view/widget/appointment_title_widget.dart';
import 'package:task_management_app/styles/colors.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.lightBlack,
        title: const Text(
          'Task Time Blocker',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.mainTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return _createAppointmentModal(context);
                },
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SfCalendar(
          showNavigationArrow: true,
          headerStyle: const CalendarHeaderStyle(
              backgroundColor: AppColors.lightBlack,
              textStyle: TextStyle(
                  fontFamily: "Chivo", color: AppColors.mainTextColor)),
          selectionDecoration: BoxDecoration(
            border: Border.all(
              color: AppColors.todayHightlightColor,
            ),
          ),
          todayHighlightColor: AppColors.todayHightlightColor,
          todayTextStyle: const TextStyle(color: AppColors.mainTextColor),
          viewHeaderStyle: const ViewHeaderStyle(
              dateTextStyle: TextStyle(color: AppColors.mainTextColor),
              dayTextStyle: TextStyle(color: AppColors.mainTextColor)),
          view: CalendarView.day,
          minDate: DateTime(2025, 01, 01, 07, 0, 0),
          allowedViews: const [CalendarView.day, CalendarView.week],
          // monthViewSettings: const MonthViewSettings(
          //   dayFormat: 'EEE',
          //   navigationDirection: MonthNavigationDirection.horizontal,
          //   showAgenda: true,
          //   agendaItemHeight: 70,
          // ),
          timeSlotViewSettings: const TimeSlotViewSettings(
            dayFormat: 'EEE',
            timeIntervalHeight: 60,
            timeTextStyle: TextStyle(
              color: AppColors.mainTextColor,
            ),
          ),
          onTap: (calendarTapDetails) {},
        ),
      ),
    );
  }

  Widget _createAppointmentModal(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * .70,
        padding: const EdgeInsets.only(top: 16.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bottomModalSheetHeader(context),
              const SizedBox(height: 10.0),
              const AppointmentTitleWidget(),
              _spaceDivider(),
              const AppointmentTimeWidget(),
              _spaceDivider(),
              const AppointmentNotificationWidget(),
              _spaceDivider(),
              const AppointmentBoardWidget(),
              _spaceDivider(),
              const AppointmentDescriptionWidget(),
              _spaceDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spaceDivider() {
    return const Column(
      children: [
        SizedBox(height: 10.0),
        Divider(color: Colors.white24),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _bottomModalSheetHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Chivo',
                color: AppColors.mainTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                fontFamily: 'Chivo',
                color: AppColors.mainTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
