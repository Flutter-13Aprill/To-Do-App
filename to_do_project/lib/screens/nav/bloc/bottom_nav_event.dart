part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class ChangeNavSelectEvent extends BottomNavEvent {
  final int index;

  ChangeNavSelectEvent({required this.index});
}
