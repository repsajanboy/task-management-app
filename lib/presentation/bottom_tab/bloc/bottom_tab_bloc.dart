import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_tab_item_type.dart';

part 'bottom_tab_event.dart';
part 'bottom_tab_state.dart';

class BottomTabBloc extends Bloc<BottomTabEvent, BottomTabState> {
  int currentIndex = 0;
  BottomTabBloc() : super(BottomTabInitial()) {
    on<InitialBottomTab>(
      (event, emit) => emit(
        CreateBottomTab(
          currentIndex: event.index,
          items: getItems(),
        ),
      ),
    );
    on<BottomTabChanged>(
      (event, emit) {
        currentIndex = event.index;
        emit(
          CreateBottomTab(
            currentIndex: currentIndex,
            items: getItems(),
          ),
        );
      },
    );
  }

  List<BottomTabItemType> getItems() {
    return [
      BottomTabItemType.dashboard,
      BottomTabItemType.planner,
      BottomTabItemType.notification,
      BottomTabItemType.profile,
    ];
  }
}
