part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class ToAddTaskEvent extends TasksEvent{}

final class AddTaskEvent extends TasksEvent{
  final TaskModel task;
  AddTaskEvent({required this.task});
}

final class SelectedDateEvent extends TasksEvent{

  SelectedDateEvent();
}