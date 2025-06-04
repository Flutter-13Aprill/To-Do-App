part of 'task_bloc.dart';


sealed class TaskState extends Equatable{
  @override
  List<Object?> get props => [];
}


class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  final List<TaskModel> filteredTasks;
  final DateTime? selectedDate;

  TaskLoaded(this.tasks, {this.selectedDate, List<TaskModel>? filtered})
      : filteredTasks = filtered ?? tasks;

  @override
  List<Object?> get props => [tasks, filteredTasks, selectedDate];
}




class TaskError extends TaskState {
  final String message;

  TaskError(this.message);

  @override
  List<Object?> get props => [message];
}