part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}

class SendTask extends IndexEvent {}

class ChangeDate extends IndexEvent {
  final int day;
  final int month;
  final int year;

  ChangeDate(this.day, this.month, this.year);
}

class AddPriority extends IndexEvent {
  final int priority;

  AddPriority({required this.priority});
}

class LoadData extends IndexEvent {}

class UpdateTask extends IndexEvent {
  final bool isDone;
  final int id;

  UpdateTask({required this.isDone, required this.id});
}
