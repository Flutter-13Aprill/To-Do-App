part of 'task_bloc.dart';


sealed class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TaskEvent {}
class FinishTasksEvent extends TaskEvent {
final int taskId;
FinishTasksEvent(this.taskId);
}
class SearchTasksEvent extends TaskEvent {
  final String query;

  SearchTasksEvent(this.query);
}
class LoadTasksByDateEvent extends TaskEvent {
  final DateTime selectedDate;

  LoadTasksByDateEvent(this.selectedDate);

  @override
  List<Object> get props => [selectedDate];
}
