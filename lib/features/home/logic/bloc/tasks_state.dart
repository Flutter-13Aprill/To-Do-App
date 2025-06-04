part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class ToShowAddTaskDialog extends TasksState{}

final class SuccessAddingTaskState extends TasksState{}

final class SuccessSelectingState extends TasksState{}