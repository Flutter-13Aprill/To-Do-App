part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarEvent {}

class ChangeNavSelectEvent extends NavBarEvent {
  final int index;

  ChangeNavSelectEvent({required this.index});
}
