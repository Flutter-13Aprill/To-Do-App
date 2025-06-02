part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class NextPage extends OnboardingEvent {}

class PreviousPage extends OnboardingEvent {}

class PageChanged extends OnboardingEvent {
  final int pageIndex;

  PageChanged(this.pageIndex);
}
