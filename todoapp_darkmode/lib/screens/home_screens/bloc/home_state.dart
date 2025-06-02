part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class TasksLoaded extends HomeState {
  final List<TaskModel> tasks;

  TasksLoaded(this.tasks);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
class TaskDetailsState extends HomeState {
  final TaskModel task;
  TaskDetailsState(this.task);
}




