part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class ChangingScreenEvent extends BottomNavEvent{
  final int index;

  ChangingScreenEvent({required this.index});
}