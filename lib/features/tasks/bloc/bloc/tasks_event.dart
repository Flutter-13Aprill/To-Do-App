part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final TaskModel task;
  AddTaskEvent(this.task);
}

class FetchTasksEvent extends TasksEvent {} 

class FetchTasksByDateEvent extends TasksEvent {
  final DateTime date;

  FetchTasksByDateEvent(this.date);
}
