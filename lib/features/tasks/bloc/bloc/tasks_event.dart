part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final TaskModel task;

  AddTaskEvent(this.task);
}
