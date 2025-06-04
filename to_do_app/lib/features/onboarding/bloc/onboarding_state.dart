part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {
  final bool onLastPage;
  final bool onFristPage;

  OnboardingInitial({required this.onFristPage, required this.onLastPage});
}
