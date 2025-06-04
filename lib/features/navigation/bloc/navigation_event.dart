part of 'navigation_bloc.dart';

sealed class NavigationEvent {}

class ChangeTabEvent extends NavigationEvent {
  final int tabIndex;
  ChangeTabEvent(this.tabIndex);
}
