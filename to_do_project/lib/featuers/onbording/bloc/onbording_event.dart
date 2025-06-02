import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingPageChanged extends OnboardingEvent {
  final int pageIndex;
  const OnboardingPageChanged(this.pageIndex);
  @override
  List<Object> get props => [pageIndex];
}

class OnboardingNextPageRequested extends OnboardingEvent {
  const OnboardingNextPageRequested();
  @override
  List<Object> get props => [];
}

class OnboardingPreviousPageRequested extends OnboardingEvent {
  const OnboardingPreviousPageRequested();
  @override
  List<Object> get props => [];
}

class OnboardingSkipRequested extends OnboardingEvent {
  const OnboardingSkipRequested();
  @override
  List<Object> get props => [];
}
