part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadTasksEvent extends HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final TaskModel task;
  AddTaskEvent(this.task);
}
class DeleteTaskEvent extends HomeEvent {
  final int id;
  DeleteTaskEvent(this.id);
}
class DetailsTaskEvent extends HomeEvent {
  final TaskModel task;
  DetailsTaskEvent(this.task);
}



