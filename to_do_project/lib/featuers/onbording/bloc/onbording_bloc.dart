import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_event.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_state.dart';
import 'package:to_do_project/featuers/onbording/data/model/onbording_model.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  late final PageController pageController;

  OnboardingBloc() : super(OnboardingState(pages: onbordingData)) {
    pageController = PageController();

    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPageRequested>(_onNextPageRequested);
    on<OnboardingPreviousPageRequested>(_onPreviousPageRequested);
    on<OnboardingSkipRequested>(_onSkipRequested);
  }

  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPageIndex: event.pageIndex));

    if (pageController.hasClients && pageController.page != event.pageIndex) {
      pageController.jumpToPage(event.pageIndex);
    }
  }

  void _onNextPageRequested(
    OnboardingNextPageRequested event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.currentPageIndex < state.pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPreviousPageRequested(
    OnboardingPreviousPageRequested event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.currentPageIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onSkipRequested(
    OnboardingSkipRequested event,
    Emitter<OnboardingState> emit,
  ) {
    pageController.jumpToPage(state.pages.length - 1);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
