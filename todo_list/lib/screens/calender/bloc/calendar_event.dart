part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

class SelectDate extends CalendarEvent {
  final DateTime date;
  SelectDate(this.date);
}

class ChangeMonth extends CalendarEvent {
  final bool next;
  ChangeMonth(this.next);
}
