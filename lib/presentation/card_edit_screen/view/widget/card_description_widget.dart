import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/presentation/card_edit_screen/card_edit.dart';
import 'package:task_management_app/styles/colors.dart';

Widget cardDescriptionTextFormField(CardsModel card) {
  return BlocBuilder<CardEditBloc, CardEditState>(
    builder: (context, state) {
      return Container(
        padding: const EdgeInsets.only(
          top: 12.0,
          left: 12.0,
          right: 12.0,
        ),
        child: TextFormField(
          initialValue: state.description ?? card.description,
          cursorColor: AppColors.mainCursorColor,
          maxLines: 10,
          style: const TextStyle(
            fontFamily: 'Chivo',
            color: Colors.white70,
            fontSize: 16.0,
          ),
          decoration: const InputDecoration(
            hintText: 'Add a description...',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white54,
            )),
          ),
          onChanged: (value) {
            context
                .read<CardEditBloc>()
                .add(CardDescriptionTextChanged(description: value));
          },
        ),
      );
    },
  );
}
