import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/data/models/cards/cards_model.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/card_edit_screen/card_edit.dart';
import 'package:task_management_app/presentation/card_edit_screen/view/widget/card_dates_widget.dart';
import 'package:task_management_app/presentation/card_edit_screen/view/widget/card_description_widget.dart';
import 'package:task_management_app/presentation/card_edit_screen/view/widget/card_priority_widget.dart';
import 'package:task_management_app/styles/colors.dart';

class CardEditScreen extends StatelessWidget {
  const CardEditScreen({
    super.key,
    required this.card,
    required this.boardId,
    required this.statusId,
  });

  final CardsModel card;
  final String boardId;
  final String statusId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CardEditBloc(boardsRepository: context.read<BoardsRepository>())
            ..add(CardValueInitialized(card: card)),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.lightBlack,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white70,
            ),
          ),
          actions: [
            BlocBuilder<CardEditBloc, CardEditState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: state.cardValuesChange!
                      ? () {
                          context.read<CardEditBloc>().add(CardEditSaved(
                              boardId: boardId, statusId: statusId));
                          Navigator.of(context).pop(true);
                        }
                      : null,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: state.cardValuesChange!
                          ? Colors.blue
                          : Colors.white30,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: _cardEditBody(),
      ),
    );
  }

  Widget _cardEditBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 12.0,
            right: 12.0,
          ),
          child: BlocBuilder<CardEditBloc, CardEditState>(
            builder: (context, state) {
              return TextFormField(
                cursorColor: AppColors.mainCursorColor,
                initialValue: state.cardName ?? card.cardName,
                style: const TextStyle(
                  fontFamily: 'Chivo',
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                ),
                onChanged: (value) {
                  context
                      .read<CardEditBloc>()
                      .add(CardNameTextChanged(cardName: value));
                },
              );
            },
          ),
        ),
        cardDescriptionTextFormField(card),
        const SizedBox(height: 10.0),
        cardDatesWidget(card),
        cardPriorityWidget(card),
      ],
    );
  }
}
