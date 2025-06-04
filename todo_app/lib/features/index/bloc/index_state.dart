part of 'index_bloc.dart';

@immutable
sealed class IndexState {}

final class IndexInitial extends IndexState {}

class SuccessState extends IndexState {
  final List<TaskModel> tasks;
  SuccessState(this.tasks);
}

final class ErrorState extends IndexState {}

final class LoadingState extends IndexState {}
