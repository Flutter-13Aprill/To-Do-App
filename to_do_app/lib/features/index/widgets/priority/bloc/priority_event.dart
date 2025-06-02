part of 'priority_bloc.dart';

@immutable
sealed class PriorityEvent {}

class SelectPriority extends PriorityEvent {
  final int priority;
  SelectPriority(this.priority);
}