part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskEvent {}

class TitleChanged extends AddTaskEvent {
  final String title;
  TitleChanged(this.title);
}

class DescriptionChanged extends AddTaskEvent {
  final String description;
  DescriptionChanged(this.description);
}

class DatePicked extends AddTaskEvent {
  final DateTime date;
  DatePicked(this.date);
}

class TimePicked extends AddTaskEvent {
  final TimeOfDay time;
  TimePicked(this.time);
}

class PriorityPicked extends AddTaskEvent {
  final int priority;
  PriorityPicked(this.priority);
}

class CategoryPicked extends AddTaskEvent {
  final String category;
  final Color categoryColor;
   final String categoryImage;
  CategoryPicked(this.category, this.categoryColor, this.categoryImage);
}

class SubmitTask extends AddTaskEvent {}
class TempCategorySelected extends AddTaskEvent {
  final String categoryName;
  TempCategorySelected(this.categoryName);
}
