part of 'onboarding_bloc.dart';

@immutable
class OnboardingState {
  final int currentPage;
  final int totalPages;

  bool get isLastPage => currentPage == totalPages - 1;
  bool get isFirstPage => currentPage == 0;

  const OnboardingState({required this.currentPage, required this.totalPages});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages,
    );
  }
}
