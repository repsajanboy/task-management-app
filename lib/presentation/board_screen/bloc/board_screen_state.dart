part of 'board_screen_bloc.dart';

class BoardScreenState extends Equatable {
  final List<StatusesModel> statuses;
  final int currentIndex;
  final bool addStatusTextBoxVisible;
  final String? statusName;

  const BoardScreenState({
    this.statuses = const <StatusesModel>[],
    this.currentIndex = 0,
    this.addStatusTextBoxVisible = false,
    this.statusName,
  });

  BoardScreenState copyWith({
    List<StatusesModel>? statuses,
    int? currentIndex,
    bool? addStatusTextBoxVisible,
    String? statusName,
  }) {
    return BoardScreenState(
      statuses: statuses ?? this.statuses,
      currentIndex: currentIndex ?? this.currentIndex,
      addStatusTextBoxVisible:
          addStatusTextBoxVisible ?? this.addStatusTextBoxVisible,
      statusName: statusName ?? this.statusName,
    );
  }

  @override
  List<Object?> get props => [
        statuses,
        currentIndex,
        addStatusTextBoxVisible,
        statusName,
      ];
}
