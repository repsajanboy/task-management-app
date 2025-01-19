import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentDescriptionWidget extends StatelessWidget {
  const AppointmentDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          const Icon(
            Icons.notes_outlined,
            color: AppColors.iconGreyColor,
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Description',
                border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
