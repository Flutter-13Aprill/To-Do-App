part of 'index_bloc.dart';

@immutable
sealed class IndexState {}

final class IndexInitial extends IndexState {}

final class AddTaskDialogShown extends IndexState {}

final class TodoChecked extends IndexState {}

final class TodoUnchecked extends IndexState {}

final class ToDosLoading extends IndexState {}

final class TodosLoaded extends IndexState {}

final class DateSelectedChanged extends IndexState {}

final class PrioritySelected extends IndexState {}

final class TodoAdded extends IndexState {}

final class TodoDeleted extends IndexState {}

final class StateRefreshed extends IndexState {}

final class TodoEdited extends IndexState {}

final class TaskScreenPopped extends IndexState {}
