import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentDescriptionWidget extends StatelessWidget {
  const AppointmentDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0),
      decoration: const BoxDecoration(
        color: AppColors.lightBlack
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(
              Icons.notes_outlined,
              color: AppColors.iconGreyColor,
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: TextFormField(
              maxLines: 3,
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
