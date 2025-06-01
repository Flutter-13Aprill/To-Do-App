part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskEvent {}

class AddTaskEventt extends AddTaskEvent {}

class TaskPriorityUpdated extends AddTaskEvent {
  final int priority;
  TaskPriorityUpdated({required this.priority});
}

class CatogryNameEvent extends AddTaskEvent {
  String name;
  CatogryNameEvent({required this.name});
}

class CatogryIconEvent extends AddTaskEvent {
  IconData iconName;
  int indexIcon;
  CatogryIconEvent({required this.iconName, required this.indexIcon});
}

class CatogryColorEvent extends AddTaskEvent {
  final Color catogryColors;
  int colorIndex;
  CatogryColorEvent({required this.catogryColors,required this.colorIndex});
}

// حدث لإنشاء الفئة الجديدة بشكل كامل
class CreateNewCategoryEvent extends AddTaskEvent {}