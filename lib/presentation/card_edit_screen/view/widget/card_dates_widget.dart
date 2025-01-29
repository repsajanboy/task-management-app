import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/presentation/card_edit_screen/card_edit.dart';
import 'package:task_management_app/styles/colors.dart';

Widget cardDatesWidget(CardsModel card) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4.0),
    padding: const EdgeInsetsDirectional.symmetric(
      vertical: 8.0,
      horizontal: 14.0,
    ),
    color: AppColors.lightBlack,
    child: Column(
      children: [
        BlocBuilder<CardEditBloc, CardEditState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2222),
                ).then((date) {
                  if (!context.mounted) return;
                  context
                      .read<CardEditBloc>()
                      .add(StartDateChanged(startDate: date));
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      state.startDate != null
                          ? DateFormat.yMMMMd().format(state.startDate!)
                          : 'Start date...',
                      style: const TextStyle(
                         fontFamily: 'Chivo',
                        color: AppColors.greyTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const Divider(thickness: .3),
        BlocBuilder<CardEditBloc, CardEditState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2222),
                ).then((date) {
                  if (!context.mounted) return;
                  context
                      .read<CardEditBloc>()
                      .add(DueDateChanged(dueDate: date));
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      state.dueDate != null
                          ? DateFormat.yMMMMd().format(state.dueDate!)
                          : 'Due date...',
                      style: const TextStyle(
                        fontFamily: 'Chivo',
                        color: AppColors.greyTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
