import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/planner/planner.dart';
import 'package:task_management_app/styles/colors.dart';

class AppointmentBoardWidget extends StatelessWidget {
  const AppointmentBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlannerBloc, PlannerState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: const BoxDecoration(
            color: AppColors.lightBlack
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color(state.backgroundColor!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Text(
                    state.boardName!,
                    style: const TextStyle(
                      fontFamily: "Chivo",
                      fontSize: 16.0,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ],
              ),
              MenuAnchor(
                builder: (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(
                      Icons.unfold_more_outlined,
                      color: AppColors.iconGreyColor,
                    ),
                  );
                },
                menuChildren: state.boards.map((e) {
                  return MenuItemButton(
                    onPressed: () {
                      context.read<PlannerBloc>().add(AppointmentBoardChanged(
                            backgroundColor: e.boardBackgroundColor,
                            boardName: e.boardTitle,
                          ));
                    },
                    child: Text(
                      e.boardTitle!,
                      style: const TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.mainTextColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
