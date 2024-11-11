import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/styles/colors.dart';
import 'package:task_management_app/utils/board_background_colors.dart';

class BoardBackgroundPicker extends StatelessWidget {
  const BoardBackgroundPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Background',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.mainTextColor,
            fontSize: 16.0
          ),
        ),
        const SizedBox(height: 10.0),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.25),
          shrinkWrap: true,
          itemCount: boardBackgroundColors.length,
          itemBuilder: (context, index) {
            return BlocBuilder<CreateBoardBloc, CreateBoardState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context
                        .read<CreateBoardBloc>()
                        .add(CreateBoardBackgroundColorSelected(
                          boardBackgroundColor:
                              boardBackgroundColors[index].value,
                          selectedBackgroundColorIndex: index
                        ));
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: boardBackgroundColors[index],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0))),
                    child: Icon(
                      Icons.check,
                      color: state.selectedBackgroundColorIndex == index
                          ? Colors.white
                          : boardBackgroundColors[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
