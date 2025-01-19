part of 'planner_bloc.dart';

class PlannerState extends Equatable {
  final String? appointmentTitle;
  final DateTime? startDate;
  final DateTime? startTime;
  final DateTime? endDate;
  final DateTime? endTime;
  final bool? allDay;
  final String? description;
  final int? backgroundColor;
  final String? boardName;
  final List<BoardsModel> boards;

  PlannerState({
    this.appointmentTitle,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? endDate,
    DateTime? endTime,
    this.allDay = false,
    this.description,
    this.backgroundColor = 4280391411,
    this.boardName = 'Select board',
    this.boards = const <BoardsModel>[],
  })  : startDate = startDate ?? DateTime.now(),
        startTime = startTime ?? DateTime.now(),
        endDate = endDate ?? DateTime.now(),
        endTime = endTime ?? DateTime.now().add(const Duration(hours: 1));

  PlannerState copyWith({
    String? appointmentTitle,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? endDate,
    DateTime? endTime,
    bool? allDay,
    String? description,
    int? backgroundColor,
    String? boardName,
    List<BoardsModel>? boards,
  }) {
    return PlannerState(
      appointmentTitle: appointmentTitle ?? this.appointmentTitle,
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      endDate: endDate ?? this.endDate,
      endTime: endTime ?? this.endTime,
      allDay: allDay ?? this.allDay,
      description: description ?? this.description,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      boardName: boardName ?? this.boardName,
      boards: boards ?? this.boards,
    );
  }

  @override
  List<Object?> get props => [
        appointmentTitle,
        startDate,
        startTime,
        endDate,
        endTime,
        allDay,
        description,
        backgroundColor,
        boardName,
        boards,
      ];
}
