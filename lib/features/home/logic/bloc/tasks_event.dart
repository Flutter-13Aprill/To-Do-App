part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class PressedFloatingButton extends TasksEvent{}

class AddTaskEvent extends TasksEvent{
  final TaskModel task;

  AddTaskEvent({required this.task});
}