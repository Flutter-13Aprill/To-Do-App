import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/index_home/screens/home_screen.dart';
import 'package:todoapp/profile/screen/profile.dart';
part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int selectIndex = 0;

  List<Widget> screens = [HomeScreen(), Center(child: Text("data")), Profile()];

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
