part of 'task_bloc.dart';


sealed class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTasksEvent extends TaskEvent {}