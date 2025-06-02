part of 'onboarding_bloc.dart';

sealed class OnboardingState {
  final int pageIndex;
  const OnboardingState(this.pageIndex);
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial(int index) : super(index);
}
