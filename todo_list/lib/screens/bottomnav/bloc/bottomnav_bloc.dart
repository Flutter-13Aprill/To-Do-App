import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/screens/calender/calendar_screen.dart';
import 'package:todo_list/screens/index/index_screen.dart';
import 'package:todo_list/screens/profile/profile_screen.dart';

part 'bottomnav_event.dart';
part 'bottomnav_state.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  int selectIndex = 0;

  List<Widget> screens = [IndexScreen(), CalendarScreen(), ProfileScreen()];

  BottomnavBloc() : super(BottomnavInitial()) {
    on<NavSelectionEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(
    NavSelectionEvent event,
    Emitter<BottomnavState> emit,
  ) {
    selectIndex = event.index;
    emit(SuccessState());
  }
}
