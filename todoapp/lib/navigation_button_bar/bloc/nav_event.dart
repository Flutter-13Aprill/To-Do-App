part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}

class ChangeNavSelectEvent extends NavEvent {
  final int index;

  ChangeNavSelectEvent({required this.index});
}
