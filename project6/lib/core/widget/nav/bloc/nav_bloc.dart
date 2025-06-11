import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project6/feature/calendar/presentation/page/calendar_page.dart';
import 'package:project6/feature/home/presentation/page/home_page.dart';
import 'package:project6/feature/profile/presentation/page/profile_page.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectedPage = 0;
  List<Widget> pages = [HomePage(), CalendarPage(), ProfilePage()];
  NavBloc() : super(NavInitial()) {
    on<NavEvent>((event, emit) {});
    on<ChangeNavSelectedEvent>(selectPage);
  }

  FutureOr<void> selectPage(
    ChangeNavSelectedEvent event,
    Emitter<NavState> emit,
  ) {
    selectedPage = event.index;
    emit(NavSelectedState());
  }
}
