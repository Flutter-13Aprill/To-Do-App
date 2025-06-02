part of 'tasks_bloc.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoaded extends TasksState {
  final List<TaskModel> tasks;

  TasksLoaded(this.tasks);
}
