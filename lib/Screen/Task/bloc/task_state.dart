import 'package:to_do_app_development/Models/Task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoadSuccess extends TaskState {
  final List<Task> allTasks;
  final List<Task> filteredTasks;

  TaskLoadSuccess({required this.allTasks, required this.filteredTasks});
}