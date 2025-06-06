part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class OnboardingPageChanged extends OnboardingEvent {
  final int index;
  OnboardingPageChanged(this.index);
}

class OnboardingNextPressed extends OnboardingEvent {}

class OnboardingBackPressed extends OnboardingEvent {}
