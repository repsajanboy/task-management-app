part of 'board_screen_bloc.dart';

class BoardScreenState extends Equatable {
  final List<StatusesModel> statuses;
  final List<CardsModel> cards;
  final int currentIndex;
  final bool addStatusTextBoxVisible;
  final bool addCardNameTextBoxVisible;
  final String? statusName;
  final int? addCardNameSelectedIndex;
  final String? cardName;
  final bool? isFetchingStatuses;

  const BoardScreenState({
    this.statuses = const <StatusesModel>[],
    this.cards = const <CardsModel>[],
    this.currentIndex = 0,
    this.addStatusTextBoxVisible = false,
    this.addCardNameTextBoxVisible = false,
    this.statusName,
    this.addCardNameSelectedIndex,
    this.cardName,
    this.isFetchingStatuses = true,
  });

  BoardScreenState copyWith({
    List<StatusesModel>? statuses,
    List<CardsModel>? cards,
    int? currentIndex,
    bool? addStatusTextBoxVisible,
    bool? addCardNameTextBoxVisible,
    String? statusName,
    int? addCardNameSelectedIndex,
    String? cardName,
    bool? isFetchingStatuses,
  }) {
    return BoardScreenState(
      statuses: statuses ?? this.statuses,
      cards: cards ?? this.cards,
      currentIndex: currentIndex ?? this.currentIndex,
      addStatusTextBoxVisible:
          addStatusTextBoxVisible ?? this.addStatusTextBoxVisible,
      addCardNameTextBoxVisible: addCardNameTextBoxVisible ?? this.addCardNameTextBoxVisible,
      statusName: statusName ?? this.statusName,
      addCardNameSelectedIndex: addCardNameSelectedIndex ?? this.addCardNameSelectedIndex,
      cardName: cardName ?? this.cardName,
      isFetchingStatuses: isFetchingStatuses ?? this.isFetchingStatuses,
    );
  }

  @override
  List<Object?> get props => [
        statuses,
        cards,
        currentIndex,
        addStatusTextBoxVisible,
        addCardNameTextBoxVisible,
        statusName,
        addCardNameSelectedIndex,
        cardName,
        isFetchingStatuses,
      ];
  
  @override
  String toString() => 'MyState(statuses: $statuses)';
}
