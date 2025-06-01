import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class TaskTitleChanged extends TaskEvent {
  final String title;
  const TaskTitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class TaskDescriptionChanged extends TaskEvent {
  final String description;
  const TaskDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class TaskDateChanged extends TaskEvent {
  final DateTime date;
  const TaskDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class TaskTimeChanged extends TaskEvent {
  final String time;
  const TaskTimeChanged(this.time);

  @override
  List<Object?> get props => [time];
}

class TaskPriorityChanged extends TaskEvent {
  final String priority;
  const TaskPriorityChanged(this.priority);

  @override
  List<Object?> get props => [priority];
}

class TaskSubmitted extends TaskEvent {
  const TaskSubmitted();
}
