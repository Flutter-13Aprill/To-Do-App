import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:to_do_app/features/calendar/calender_screen.dart';
import 'package:to_do_app/features/index/index_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/profile/profile_screen.dart';
part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectIndex = 0;

  List<Widget> screens = [IndexScreen(),CalenderScreen(),ProfileScreen()];

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
