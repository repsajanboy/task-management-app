part of 'board_screen_bloc.dart';

class BoardScreenState extends Equatable {
  final List<StatusesModel> statuses;

  const BoardScreenState({
    this.statuses = const <StatusesModel>[],
  });

  BoardScreenState copyWith({
    List<StatusesModel>? statuses,
  }) {
    return BoardScreenState(
      statuses: statuses ?? this.statuses,
    );
  }

  @override
  List<Object> get props => [statuses];
}
