part of 'nav_bloc.dart';

sealed class NavEvent {}

//the event will change the ui dep on the index
class chaneUi extends NavEvent {
  final int index;

  chaneUi({required this.index});
}
