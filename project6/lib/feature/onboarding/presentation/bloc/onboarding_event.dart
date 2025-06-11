part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}

class UpdateCurrentPageEvent extends OnboardingEvent {
  final int pageIndex;

  UpdateCurrentPageEvent({required this.pageIndex});
}

class CompleteOnboardingEvent extends OnboardingEvent {}
