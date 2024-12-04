import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/cards/card_priority_model.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/presentation/card_edit_screen/card_edit.dart';
import 'package:task_management_app/styles/colors.dart';

Widget cardPriorityWidget(CardsModel card) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
      color: AppColors.lightBlack,
      child: BlocBuilder<CardEditBloc, CardEditState>(
        builder: (context, state) {
          return DropdownMenu<CardPriority>(
            initialSelection: cardPriorityList[card.priority! - 1],
            width: double.infinity,
            trailingIcon: const SizedBox(),
            selectedTrailingIcon: const SizedBox(),
            leadingIcon: card.priority != 0
                ? cardPriorityList[card.priority! - 1].icon
                : state.priorityIndex == 0
                    ? const Icon(Icons.priority_high, color: Colors.white70)
                    : cardPriorityList[state.priorityIndex! - 1].icon,
            hintText: 'Priority',
            inputDecorationTheme: const InputDecorationTheme(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: 'Chivo',
                  color: Colors.white70,
                  fontSize: 16.0,
                )),
            textStyle: const TextStyle(
              fontFamily: 'Chivo',
              color: Colors.white70,
              fontSize: 16.0,
            ),
            menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.lightBlack)),
            onSelected: (value) {
              if (!context.mounted) return;
              context
                  .read<CardEditBloc>()
                  .add(PrioritySelected(priorityIndex: value?.id));
            },
            dropdownMenuEntries: cardPriorityList
                .map<DropdownMenuEntry<CardPriority>>((value) {
                  return DropdownMenuEntry(
                      value: cardPriorityList[value.id! - 1],
                      label: value.label!,
                      leadingIcon: value.icon,
                      style: const ButtonStyle(
                          foregroundColor:
                              WidgetStatePropertyAll(Colors.white70)));
                })
                .toList()
                .reversed
                .toList(),
          );
        },
      ));
}
