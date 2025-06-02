part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class OnboardingPageChanged extends OnboardingEvent {
  final int currentPage;

  OnboardingPageChanged(this.currentPage);
}
