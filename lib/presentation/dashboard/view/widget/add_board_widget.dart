import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/presentation/dashboard/view/widget/background_color_picker.dart';
import 'package:task_management_app/presentation/dashboard/view/widget/board_title_textfield.dart';
import 'package:task_management_app/styles/colors.dart';

class AddBoardWidget extends StatelessWidget {
  const AddBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          builder: (BuildContext context) {
            return _createBoardModal(context);
          },
        ).whenComplete(() {
          if(!context.mounted) {
            return;
          }
          BlocProvider.of<BoardsListBloc>(context).add(BoardsFetched());
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBlack,
          border: Border.all(color: Colors.white24),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: AppColors.mainTextColor,
                size: 64,
              ),
              Text(
                'Add board',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  color: AppColors.mainTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBoardModal(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bottomModalSheetHeader(context),
              const SizedBox(height: 10.0),
              const BoardTitleWidget(),
              const SizedBox(height: 10.0),
              const BoardBackgroundPicker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomModalSheetHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<BoardsListBloc, BoardsListState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<BoardsListBloc>().add(RemoveCreateBoardSelectedBackgroundColorIndex());
                  Navigator.pop(context);
                } ,
                icon: const Icon(Icons.close),
                color: Colors.white54,
              );
            },
          ),
          const Text(
            'Create board',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.mainTextColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w700),
          ),
          BlocBuilder<BoardsListBloc, BoardsListState>(
            builder: (context, state) {
              return IconButton(
                onPressed: (state.boardTitle ?? '').trim().isEmpty
                    ? null
                    : () {
                        context.read<BoardsListBloc>().add(CreateBoardSaved());
                        Navigator.pop(context);
                      },
                disabledColor: Colors.white54,
                icon: const Icon(Icons.add),
                color: Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}
