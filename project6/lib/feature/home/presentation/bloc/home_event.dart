part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class AddTaskEvent extends HomeEvent {}
class DeleteTaskEvent extends HomeEvent {}
class UpdateTaskEvent extends HomeEvent {}
class FetchTasksEvent extends HomeEvent {}
