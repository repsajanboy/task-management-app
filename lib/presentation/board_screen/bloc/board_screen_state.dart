part of 'board_screen_bloc.dart';

class BoardScreenState extends Equatable {
  final List<StatusesModel> statuses;
  final int currentIndex;
  final bool addStatusTextBoxVisible;
  final bool addCardNameTextBoxVisible;
  final String? statusName;
  final int? addCardNameSelectedIndex;
  final String? cardName;

  const BoardScreenState({
    this.statuses = const <StatusesModel>[],
    this.currentIndex = 0,
    this.addStatusTextBoxVisible = false,
    this.addCardNameTextBoxVisible = false,
    this.statusName,
    this.addCardNameSelectedIndex,
    this.cardName,
  });

  BoardScreenState copyWith({
    List<StatusesModel>? statuses,
    int? currentIndex,
    bool? addStatusTextBoxVisible,
    bool? addCardNameTextBoxVisible,
    String? statusName,
    int? addCardNameSelectedIndex,
    String? cardName,
  }) {
    return BoardScreenState(
      statuses: statuses ?? this.statuses,
      currentIndex: currentIndex ?? this.currentIndex,
      addStatusTextBoxVisible:
          addStatusTextBoxVisible ?? this.addStatusTextBoxVisible,
      addCardNameTextBoxVisible: addCardNameTextBoxVisible ?? this.addCardNameTextBoxVisible,
      statusName: statusName ?? this.statusName,
      addCardNameSelectedIndex: addCardNameSelectedIndex ?? this.addCardNameSelectedIndex,
      cardName: cardName ?? this.cardName,
    );
  }

  @override
  List<Object?> get props => [
        statuses,
        currentIndex,
        addStatusTextBoxVisible,
        addCardNameTextBoxVisible,
        statusName,
        addCardNameSelectedIndex,
        cardName,
      ];
}
