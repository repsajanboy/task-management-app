part of 'bottom_tab_bloc.dart';

@immutable
sealed class BottomTabEvent {}

class InitialBottomTab extends BottomTabEvent {
  final int index;

  InitialBottomTab(this.index);
}

class BottomTabChanged extends BottomTabEvent {
  final int index;

  BottomTabChanged(this.index);
}
