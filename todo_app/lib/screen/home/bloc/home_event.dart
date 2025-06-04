part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class AddTaskEvent extends HomeEvent {}

class SelectPriorityEvent extends HomeEvent {
  final int priority;
  SelectPriorityEvent(this.priority);
}

class SelectDateTimeEvent extends HomeEvent {
  final DateTime dateTime;
  SelectDateTimeEvent(this.dateTime);
}

// class LodTasksEvent extends HomeEvent {}

// class SelectTaskDateEvent extends HomeEvent {
//   final DateTime date;

//   SelectTaskDateEvent(this.date);
// }

// class SelectTaskTimeEvent extends HomeEvent {
//   final TimeOfDay time;

//   SelectTaskTimeEvent(this.time);
// }
