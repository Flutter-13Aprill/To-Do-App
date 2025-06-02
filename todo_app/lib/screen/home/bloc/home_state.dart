part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TaskAddedSuccessState extends HomeState {}

final class TasksLoadedState extends HomeState {
  final List<TaskModel> tasks;

  TasksLoadedState(this.tasks);
}

final class TaskAddedErrorState extends HomeState {
  final Object message;

  TaskAddedErrorState({required this.message});
}
