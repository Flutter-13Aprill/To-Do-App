part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingPageChanged extends OnboardingState {}

final class OnboardingSkipped extends OnboardingState {}
