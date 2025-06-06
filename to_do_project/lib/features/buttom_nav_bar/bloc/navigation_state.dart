part of 'navigation_bloc.dart';

@immutable
class NavigationState {
  final int currentIndex;

  const NavigationState({required this.currentIndex});

  NavigationState copyWith({int? currentIndex}) {
    return NavigationState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
