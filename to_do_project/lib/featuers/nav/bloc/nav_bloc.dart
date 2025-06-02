import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:to_do_project/featuers/calender/presentation/pages/calender_screen.dart';
import 'package:to_do_project/featuers/home/presentation/pages/home_screen.dart';
import 'package:to_do_project/featuers/profile/presentation/pages/profile_screen.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectIndex = 0;

  List<Widget> screens = [HomeScreen(), CalenderScreen(), ProfileScreen()];

  NavBloc() : super(NavInitial()) {
    on<chaneUi>(changeMethod);
  }

  FutureOr<void> changeMethod(chaneUi event, Emitter<NavState> emit) {
    selectIndex = event.index;
    emit(RefreshUIState());
  }
}
