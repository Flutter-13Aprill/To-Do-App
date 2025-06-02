import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do_project/screens/calender/calender_screen.dart';
import 'package:to_do_project/screens/index/index_screen.dart';
import 'package:to_do_project/screens/profile/profile_screen.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  int selectIndex = 0;
  List<Widget> destinations = [
    IndexScreen(),
    CalenderScreen(),
    ProfileScreen(),
  ];
  BottomNavBloc() : super(BottomNavInitial()) {
    // on<BottomNavEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    // on<BottomNavEvent>(changeMethod);
    // on<ChangeNavSelectEvent>(changeMethod);
    on<ChangeNavSelectEvent>(changeMetod);
  }



  FutureOr<void> changeMetod(
    ChangeNavSelectEvent event,
    Emitter<BottomNavState> emit,
  ) {
    selectIndex = event.index;
    emit(SuccessBottomNavState());
  }
}
