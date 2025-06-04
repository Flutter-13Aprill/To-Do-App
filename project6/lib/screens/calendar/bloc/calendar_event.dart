part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

final class ChangTabEvent extends CalendarEvent{

  final int tabIndex;

  ChangTabEvent({required this.tabIndex});

}