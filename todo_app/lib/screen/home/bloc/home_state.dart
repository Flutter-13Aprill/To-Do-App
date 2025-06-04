part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TaskAddedSuccessState extends HomeState {
  final List<TaskModel> tasks;

  TaskAddedSuccessState(this.tasks);
}

final class TaskErrorState extends HomeState {
  final Object message;

  TaskErrorState({required this.message});
}

class PrioritySelectedState extends HomeState {
  final int priority;
  PrioritySelectedState(this.priority);
}

class DateTimeSelectedState extends HomeState {
  final DateTime dateTime;
  DateTimeSelectedState(this.dateTime);
}

// final class UpdateSelectedDateState extends HomeState {
//   final DateTime selectedDate;

//   UpdateSelectedDateState(this.selectedDate);
// }

// final class TasksLoadedState extends HomeState {
//   final List<TaskModel> tasks;

//   TasksLoadedState(this.tasks);
// }

// final class TaskAddedErrorState extends HomeState {
//   final Object message;

//   TaskAddedErrorState({required this.message});
// }
