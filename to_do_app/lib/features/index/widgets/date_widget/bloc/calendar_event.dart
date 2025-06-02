part of 'calendar_bloc.dart';

sealed class CalendarEvent {}

class CalendarDateChanged extends CalendarEvent {
  final DateTime date;

  CalendarDateChanged(this.date);
}

class CalendarTimeChanged extends CalendarEvent {
  final TimeOfDay time;

  CalendarTimeChanged(this.time);
}