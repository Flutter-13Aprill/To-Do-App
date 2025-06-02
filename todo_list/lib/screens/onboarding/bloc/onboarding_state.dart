part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {
  final int index;

  OnboardingState({this.index = 0});
}

final class OnboardingInitial extends OnboardingState {}

final class SuccessState extends OnboardingState {
  final int index;

  SuccessState({this.index = 0});
}
