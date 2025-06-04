part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

class LoadCalendarDataEvent extends CalendarEvent {}

class UpdateSelectedDateEvent extends CalendarEvent {}
