part of 'navigation_bloc.dart';

sealed class NavigationState {
  final int selectedIndex;
  const NavigationState(this.selectedIndex);
}

class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(0);
}

class NavigationTabChanged extends NavigationState {
  const NavigationTabChanged(int index) : super(index);
}
