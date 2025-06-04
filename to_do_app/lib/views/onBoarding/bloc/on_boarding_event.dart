part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

class ChangeCurrentIndex extends OnBoardingEvent {
  final int index;

  ChangeCurrentIndex({required this.index});
}

class NextView extends OnBoardingEvent {}
class BackView extends OnBoardingEvent {}
