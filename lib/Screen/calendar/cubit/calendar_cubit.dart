import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Screen/calendar/cubit/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(selectedDate: DateTime.now(), showCompleted: false));

  void toggleCompleted(bool value) => emit(state.copyWith(showCompleted: value));
  void updateSelectedDate(DateTime date) => emit(state.copyWith(selectedDate: date));
}