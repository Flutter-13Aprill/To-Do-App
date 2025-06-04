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
  final String priority;
  SelectPriority(this.priority);
}

final class AddTodo extends IndexEvent {}

final class DeleteTodo extends IndexEvent {
  final BuildContext context;
  final ToDoModel todo;
  DeleteTodo(this.todo, this.context);
}

final class PopTaskscreen extends IndexEvent {
  final BuildContext context;
  PopTaskscreen(this.context);
}

final class RefreshScreen extends IndexEvent {
  final BuildContext context;
  RefreshScreen(this.context);
}

final class EditTodo extends IndexEvent {
  final BuildContext context;
  final ToDoModel todo;
  EditTodo(this.context, this.todo);
}

/// When the user types in the “task name” TextField
class PreviewNameChanged extends IndexEvent {
  final String newName;
  PreviewNameChanged(this.newName);
}

/// When the user types in the “description” TextField
class PreviewDescriptionChanged extends IndexEvent {
  final String newDesc;
  PreviewDescriptionChanged(this.newDesc);
}
