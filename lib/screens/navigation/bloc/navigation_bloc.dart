import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/screens/home/calendar/calendar_screen.dart';
import 'package:to_do_list/screens/home/index/index.dart';
import 'package:to_do_list/screens/home/profile/profile_screen.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  int selectedIndex = 0;
  List<Widget> navigationScreens = [
    IndexScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];
  NavigationBloc() : super(NavigationInitial()) {
  on<DestinationsSelectedEvent>(changeDestination);
  }

  FutureOr<void> changeDestination(DestinationsSelectedEvent event, Emitter<NavigationState> emit) {
    selectedIndex = event.selectedDestination;
  }
}
