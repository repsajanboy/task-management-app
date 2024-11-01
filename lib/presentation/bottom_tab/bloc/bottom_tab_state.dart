part of 'bottom_tab_bloc.dart';

@immutable
sealed class BottomTabState {}

final class BottomTabInitial extends BottomTabState {}

class CreateBottomTab extends BottomTabState {
  final int currentIndex;
  final List<BottomTabItemType> items;

  CreateBottomTab({required this.currentIndex, required this.items});

}