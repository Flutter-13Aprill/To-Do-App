part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

final class ChangeOnboardingPage extends OnboardingEvent {}

final class NextButtonPressed extends OnboardingEvent {
  final BuildContext context;
  NextButtonPressed(this.context);
}

final class PreviousButtonPressed extends OnboardingEvent {}

final class SkipOnboarding extends OnboardingEvent {
  final BuildContext context;
  SkipOnboarding(this.context);
}
