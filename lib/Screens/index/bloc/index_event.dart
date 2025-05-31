part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}

final class AddToDoButtonPressed extends IndexEvent {}

final class TodoCheckButtonPressed extends IndexEvent {
  final ToDoModel todo;

  TodoCheckButtonPressed({required this.todo});
}

class DateSelected extends IndexEvent {
  final DateTime selectedDate;
  DateSelected(this.selectedDate);
}

final class SelectPriority extends IndexEvent {
  final int priority;
  SelectPriority(this.priority);
}

final class AddTodo extends IndexEvent {}
