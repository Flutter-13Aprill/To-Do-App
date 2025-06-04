part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class ChangeTaskState extends TaskEvent {
  final int taskIndex;

  ChangeTaskState({required this.taskIndex});
}
