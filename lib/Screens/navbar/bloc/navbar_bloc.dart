import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:getit/Screens/calendar/calendar_screen.dart';
import 'package:getit/Screens/index/index_screen.dart';
import 'package:getit/Screens/profile/profile_screen.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  int currentIndex = 0;
  List<Widget> screens = [IndexScreen(), CalendarScreen(), ProfileScreen()];
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavbarIndexChanged>((event, emit) {
      currentIndex = event.index;
      emit(NavbarIndexChangedState());
    });
  }
}
