part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class PageChangedEvent extends OnboardingEvent{
  final int index; 
  PageChangedEvent({required this.index});
}