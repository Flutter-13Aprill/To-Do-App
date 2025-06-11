part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}

class ChangeNavSelectedEvent extends NavEvent {
  final int index;
  ChangeNavSelectedEvent({required this.index});
}
