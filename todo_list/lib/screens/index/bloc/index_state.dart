part of 'index_bloc.dart';

@immutable
sealed class IndexState {}

final class IndexInitial extends IndexState {}

final class LoadingState extends IndexState {}

final class ErrorState extends IndexState {}

final class LoadingAddState extends IndexState {}

final class PriorityUpdatedState extends IndexState {}

final class CategoryUpdatedState extends IndexState {}

class TasksLoadedState extends IndexState {
  final List<TaskModel> tasks;
  TasksLoadedState({required this.tasks});
}

class TaskSavedState extends IndexState {}

class DateUpdatedState extends IndexState {
  final DateTime date;

  DateUpdatedState({required this.date});
}

class TimeUpdatedState extends IndexState {
  final TimeOfDay time;
  TimeUpdatedState({required this.time});
}
