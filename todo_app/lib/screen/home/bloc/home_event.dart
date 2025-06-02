part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final String title;
  final String description;

  AddTaskEvent({required this.title, required this.description});
}

class LodTasksEvent extends HomeEvent {}
