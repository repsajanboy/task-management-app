import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/planner/bloc/planner_bloc.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentTitleWidget extends StatelessWidget {
  const AppointmentTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlannerBloc, PlannerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 64.0),
          child: TextFormField(
            initialValue: state.appointmentTitle ?? '',
            cursorColor: AppColors.mainCursorColor,
            style: const TextStyle(
              fontFamily: 'Chivo',
              fontSize: 20.0,
              color: AppColors.mainTextColor,
            ),
            decoration: const InputDecoration(
              hintText: 'Add title',
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20.0,
                color: Colors.white54,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              context
                  .read<PlannerBloc>()
                  .add(AppointmentTitleChanged(title: value));
            },
          ),
        );
      },
    );
  }
}
