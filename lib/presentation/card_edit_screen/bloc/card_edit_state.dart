part of 'card_edit_bloc.dart';

class CardEditState extends Equatable {
  final String? uid;
  final String? cardName;
  final String? description;
  final DateTime? startDate;
  final DateTime? dueDate;
  final int? priority;
  final int? priorityIndex;
  final bool? cardValuesChange;
  final int? cardIndex;

  const CardEditState({
    this.uid,
    this.cardName,
    this.description,
    this.startDate,
    this.dueDate,
    this.priority,
    this.priorityIndex = 0,
    this.cardValuesChange = false,
    this.cardIndex,
  });

  CardEditState copyWith({
    String? uid,
    String? cardName,
    String? description,
    DateTime? startDate,
    DateTime? dueDate,
    int? priority,
    int? priorityIndex,
    bool? cardValuesChange,
    int? cardIndex,
  }) {
    return CardEditState(
      uid: uid ?? this.uid,
      cardName: cardName ?? this.cardName,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      priorityIndex: priorityIndex ?? this.priorityIndex,
      cardValuesChange: cardValuesChange ?? this.cardValuesChange,
      cardIndex: cardIndex ?? this.cardIndex,
    );
  }

  @override
  List<Object?> get props => [
    uid,
    cardName,
    description,
    startDate,
    dueDate,
    priority,
    priorityIndex,
    cardValuesChange,
    cardIndex,
  ];
}
