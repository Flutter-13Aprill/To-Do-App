part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}

class AddTaskEvent extends IndexEvent {}

class SaveDataEvent extends IndexEvent {}

class PrioritySelectedEvent extends IndexEvent {
  final int priority;
  PrioritySelectedEvent(this.priority);
}

class CategorySelectedEvent extends IndexEvent {
  final int category;
  CategorySelectedEvent(this.category);
}

class ToggleTaskCompletedEvent extends IndexEvent {
  final int taskId;
  ToggleTaskCompletedEvent(this.taskId);
}

class FetchTasksEvent extends IndexEvent {}

class LoadDataEvent extends IndexEvent {}

class SearchTasksEvent extends IndexEvent {
  final String query;
  SearchTasksEvent(this.query);
}

class DateSelectedEvent extends IndexEvent {
  final DateTime date;
  DateSelectedEvent(this.date);
}

class TimeSelectedEvent extends IndexEvent {
  final TimeOfDay time;
  TimeSelectedEvent(this.time);
}

class DeleteTaskEvent extends IndexEvent {
  final int taskId;
  DeleteTaskEvent({required this.taskId});
}
