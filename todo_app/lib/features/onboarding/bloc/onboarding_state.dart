part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class SuccessState extends OnboardingState {
  final int pageNumber;
  SuccessState({required this.pageNumber});
}
