part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

//date
class GetDateEvent extends HomeEvent {
  final DateTime day;

  GetDateEvent({required this.day});
}

//Time
class GetTimeEvent extends HomeEvent {
  final DateTime time;

  GetTimeEvent({required this.time});
}

//Task Priority
class TaskPriorityEvent extends HomeEvent {
  final int taskPriority;

  TaskPriorityEvent({required this.taskPriority});
}

//Create Category
class CreateCategoryEvent extends HomeEvent {
  CreateCategoryEvent();
}

class ColorSelectedEvent extends HomeEvent {
  final Color colorSelect;

  ColorSelectedEvent({required this.colorSelect});
}

class IconSelectedEvent extends HomeEvent {
  final IconData iconSelect;

  IconSelectedEvent({required this.iconSelect});
}

class LoadCategoriesEvent extends HomeEvent {}

//////////////////////////////////////////////////////

class AddTaskEvent extends HomeEvent {}

class DeleteTaskEvent extends HomeEvent {}

class UpdateTaskEvent extends HomeEvent {}

class FetchTasksEvent extends HomeEvent {}
