part of 'calendar_bloc.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

class SuccessState extends CalendarState {
  final List<TaskModel> tasks;

  SuccessState(this.tasks);
}

final class ErrorState extends CalendarState {}

final class LoadingState extends CalendarState {}
