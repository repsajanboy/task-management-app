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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mainTextColor),
      ),
      child: const Center(
        child: Text(
          'Add elements/widget here',
          style: TextStyle(color: AppColors.mainTextColor),
        ),
      ),
    );
  }

  Widget _boardsCardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0, top: 8.0),
          child: Text(
            'Your Boards',
            style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 50,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          margin: const EdgeInsets.only(
              bottom: 18.0), //update this to better approach
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
                          border: Border.all(color: Colors.white70),
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
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  state.boards[index - 1].boardTitle!,
                                  style: const TextStyle(
                                    fontFamily: 'Chivo',
                                    color: AppColors.mainTextColor,
                                    fontSize: 18,
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
      ],
    );
  }
}
