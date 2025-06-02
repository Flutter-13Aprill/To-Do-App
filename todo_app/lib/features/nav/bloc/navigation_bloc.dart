import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/Calendar/screens/calendar_screen.dart';
import 'package:todo_app/features/Index/screens/index_screen.dart';
import 'package:todo_app/features/profile/screens/profile_screen.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

/// Manages navigation state by handling navigation item selection events.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<Widget> screens = [
    IndexScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];
  NavigationBloc() : super(NavigationBarState(0)) {
    on<NavigationEvent>((event, emit) {});
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationBarState(event.index));
    });
  }
}
