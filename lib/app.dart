import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/networking/repositories/repositories.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/presentation/planner/bloc/planner_bloc.dart';
import 'package:task_management_app/routing/app_router.dart';

import 'presentation/board_screen/board_screen.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BoardsRepository>(
          create: (context) => BoardsRepository(),
        ),
        RepositoryProvider(
          create: (context) => AppointmentRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BoardsListBloc(
                boardsRepository: context.read<BoardsRepository>())
              ..add(BoardsFetched()),
          ),
          BlocProvider(
            create: (context) => BoardScreenBloc(
                boardsRepository: context.read<BoardsRepository>()),
          ),
          BlocProvider(
            create: (context) => PlannerBloc(
                appointmentRepository: context.read<AppointmentRepository>(),
                context: context)
              ..add(AppointmentsFetched()),
          )
        ],
        child: MaterialApp(
          title: 'Task Management App',
          theme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  secondary: Colors.blue[400]!)),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.onGenerateRoute,
        ),
      ),
    );
  }
}
