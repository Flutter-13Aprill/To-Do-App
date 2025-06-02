import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/screen/calendar/calendar_screen.dart';
import 'package:to_do_app/screen/index/index_Screen.dart';
import 'package:to_do_app/screen/profile/profile_screen.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectIndex = 0;

  List<Widget> listWidget = [IndexScreen(), CalendarScreen(), ProfileScreen()];

  NavBloc() : super(NavInitial()) {
    on<ChangeNavSelectEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(
    ChangeNavSelectEvent event,
    Emitter<NavState> emit,
  ) {
    selectIndex = event.index;
    emit(RefreshUIState());
  }
}
