import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/networking/repositories/boards_repository.dart';
import 'package:task_management_app/presentation/dashboard/dashboard.dart';
import 'package:task_management_app/routing/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BoardsRepository>(
          create: (context) => BoardsRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BoardsListBloc(
                boardsRepository: context.read<BoardsRepository>())
              ..add(BoardsFetched()),
          ),
        ],
        child: MaterialApp(
          title: 'Task Management App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.onGenerateRoute,
        ),
      ),
    );
  }
}
