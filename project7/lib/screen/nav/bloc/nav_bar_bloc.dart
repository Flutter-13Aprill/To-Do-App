import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:project7/screen/calendar_screen.dart';
import 'package:project7/screen/index_screen.dart';
import 'package:project7/screen/profile_screen.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int selectIndex = 0;
  List<Widget> screens = [
    const IndexScreen(),

    const CalendarScreen(),
    const ProfileScreen(),
  ];

  NavBarBloc() : super(NavBarInitial()) {
    on<ChangeNavSelectEvent>(changeMethod);

    on<NavBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  FutureOr<void> changeMethod(
    ChangeNavSelectEvent event,
    Emitter<NavBarState> emit,
  ) {
    selectIndex = event.index;
    emit(RefreshUIState());
  }
}
