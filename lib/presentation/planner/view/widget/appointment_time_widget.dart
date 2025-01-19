import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/presentation/planner/bloc/planner_bloc.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentTimeWidget extends StatelessWidget {
  const AppointmentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlannerBloc, PlannerState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: AppColors.iconGreyColor,
                      ),
                      SizedBox(width: 18.0),
                      Text(
                        'All Day',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    activeColor: Colors.blue,
                    value: state.allDay!,
                    onChanged: (value) {
                      context
                          .read<PlannerBloc>()
                          .add(AppointmentAllDaySwtichChanged(allDay: value));
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 42.0),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2222),
                          ).then((date) {
                            if (!context.mounted) {
                              return;
                            }

                            context.read<PlannerBloc>().add(
                                AppointmentStartDateChanged(startDate: date));
                          });
                        },
                        child: Text(
                          DateFormat("EEE, MMMM d").format(state.startDate!),
                          style: const TextStyle(
                            fontFamily: "Chivo",
                            color: AppColors.mainTextColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: state.startTime!.hour,
                          minute: state.startTime!.minute,
                        ),
                      ).then((time) {
                        if (!context.mounted) {
                          return;
                        }
                        if (time != null) {
                          final updatedStartTime = DateTime(
                            state.startDate!.year,
                            state.startDate!.month,
                            state.startDate!.day,
                            time.hour,
                            time.minute,
                          );
                          context.read<PlannerBloc>().add(
                              AppointmentStartTimeChanged(
                                  startTime: updatedStartTime));
                        }
                      });
                    },
                    child: Text(
                      DateFormat.jm().format(state.startTime!),
                      style: const TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 42.0),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2222),
                          ).then((date) {
                            if (!context.mounted) {
                              return;
                            }

                            context
                                .read<PlannerBloc>()
                                .add(AppointmentEndDateChanged(endDate: date));
                          });
                        },
                        child: Text(
                          DateFormat("EEE, MMMM d").format(state.endDate!),
                          style: const TextStyle(
                            fontFamily: "Chivo",
                            color: AppColors.mainTextColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                          hour: state.endTime!.hour,
                          minute: state.endTime!.minute,
                        ),
                      ).then((time) {
                        if (!context.mounted) {
                          return;
                        }
                        if (time != null) {
                          final updatedEndTime = DateTime(
                            state.endDate!.year,
                            state.endDate!.month,
                            state.endDate!.day,
                            time.hour,
                            time.minute,
                          );
                          context.read<PlannerBloc>().add(
                              AppointmentEndTimeChanged(
                                  endTime: updatedEndTime));
                        }
                      });
                    },
                    child: Text(
                      DateFormat.jm().format(state.endTime!),
                      style: const TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.mainTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
