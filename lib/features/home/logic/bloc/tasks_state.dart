part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class SuccessPressingFloatingButtonState extends TasksState{}

final class SuccessSelectDateState extends TasksState{}

final class SuccessAddTaskState extends TasksState {}
