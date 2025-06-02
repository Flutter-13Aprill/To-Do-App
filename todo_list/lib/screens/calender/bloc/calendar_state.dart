part of 'calendar_bloc.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

class CalendarSuccess extends CalendarState {
  final DateTime selectedDate;
  CalendarSuccess(this.selectedDate);
}
