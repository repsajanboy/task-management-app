import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/presentation/dashboard/view/widget/add_board_widget.dart';
import 'package:task_management_app/presentation/dashboard/view/widget/greeting_message.dart';
import 'package:task_management_app/routing/app_router_names.dart';
import 'package:task_management_app/styles/colors.dart';

int hexToInteger(String hex) => int.parse(hex, radix: 16);

extension StringColorExtensions on String {
  Color toColor() => Color(hexToInteger(this));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dashBoardsHeader(),
            _addElementHere(),
            Expanded(
              child: _boardsCardWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashBoardsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              'JM',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greetingMessage(),
                style: const TextStyle(
                  color: AppColors.mainTextColor,
                  fontFamily: 'Chivo',
                ),
              ),
              const Text(
                'Jasper Janboy!',
                style: TextStyle(
                  fontFamily: 'Chivo',
                  color: AppColors.mainTextColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addElementHere() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.white,
        color: AppColors.lightBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 14.0,
                    backgroundColor: AppColors.iconGreyColor,
                    child: Icon(
                      Icons.star_rounded,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'GO PREMIUM!',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Stay organized, boost productivity, and achieve your goals effortlessly with unlimited boards, automatic card sorter and many more.',
                style: TextStyle(
                  fontFamily: "chivo",
                  color: AppColors.mainTextColor,
                  fontSize: 12.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start free trial now',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _boardsCardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 8.0),
          child: Text(
            'Your Boards',
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: 50,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            margin: const EdgeInsets.only(bottom: 18.0),
            child: BlocBuilder<BoardsListBloc, BoardsListState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: .8,
                  ),
                  shrinkWrap: true,
                  itemCount: state.boards.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return const AddBoardWidget();
                    } else {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.board,
                            arguments: state.boards[index - 1],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightBlack,
                            border: Border.all(
                              color: Colors.white24,
                            ), //change border color
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 8.0,
                                  ),
                                  child: Text(
                                    state.boards[index - 1].boardTitle!,
                                    style: const TextStyle(
                                      fontFamily: 'Chivo',
                                      color: AppColors.mainTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(
                                      state.boards[index - 1]
                                          .boardBackgroundColor!,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: AppColors.mainTextColor,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
