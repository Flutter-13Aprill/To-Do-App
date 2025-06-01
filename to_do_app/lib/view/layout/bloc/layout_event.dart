part of 'layout_bloc.dart';

@immutable
sealed class LayoutEvent {}

class AddNewTask extends LayoutEvent {
  final TaskModel task;
  AddNewTask({required this.task});
}

class ChangePage extends LayoutEvent {
  final int layoutIndex;
  ChangePage({required this.layoutIndex});
}

class ShowBottomSheet extends LayoutEvent {}

class ShowCalender extends LayoutEvent {}
class ShowTag extends LayoutEvent {}
class ShowFlag extends LayoutEvent {}
