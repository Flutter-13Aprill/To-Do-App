import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc()
      : super(CalendarState(
            selectedDate: DateTime.now(), selectedTime: TimeOfDay.now())) {
    on<CalendarDateChanged>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });

    on<CalendarTimeChanged>((event, emit) {
      emit(state.copyWith(selectedTime: event.time));
    });
  }
}
