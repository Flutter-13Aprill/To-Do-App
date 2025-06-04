import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
// import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();
  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/Group 182.png',
      'title': 'Manage your tasks',
      'subtitle':
          '''You can easily manage all of your daily tasks in DoMe for free''',
    },
    {
      'image': 'assets/images/Frame 162.png',
      'title': 'Create daily routine',
      'subtitle':
          '''In Uptodo  you can create your personalized routine to stay productive''',
    },
    {
      'image': 'assets/images/Frame 161.png',
      'title': 'Orgonaize your tasks',
      'subtitle':
          '''You can organize your daily tasks by adding your tasks into separate categories''',
    },
  ];

  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<NextPageEvent>((event, emit) {
      final nextPage = state.currentPage + 1;
      if (nextPage < pages.length) {
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(OnboardingState(currentPage: nextPage));
      }
    });
    on<PreviousPageEvent>((event, emit) {
      final previousPage = state.currentPage - 1;
      if (previousPage < pages.length) {
        pageController.animateToPage(
          previousPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(OnboardingState(currentPage: previousPage));
      }
    });
    on<PageChangedEvent>((event, emit) {
      emit(OnboardingState(currentPage: event.index));
    });
  }
}
