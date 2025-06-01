part of 'nav_bloc.dart';

@immutable
sealed class NavState {}

 class NavInitial extends NavState {
  final int currentIndex;
  final List<Task>? tasks; // **أعدنا خاصية المهام هنا**

  NavInitial({this.currentIndex = 0, this.tasks}); // **وعدلنا الـ constructor لاستقبالها**
}