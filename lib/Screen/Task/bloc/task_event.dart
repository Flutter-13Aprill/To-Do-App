import 'package:to_do_app_development/Models/Task_model.dart';

abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);
}

class SearchTaskEvent extends TaskEvent {
  final String query;
  SearchTaskEvent(this.query);
}
class EditTaskEvent extends TaskEvent {
  final int index;
  final Task updatedTask;
  EditTaskEvent({required this.index, required this.updatedTask});
}

class DeleteTaskEvent extends TaskEvent {
  final int index;
  DeleteTaskEvent(this.index);
}