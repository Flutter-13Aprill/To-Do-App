import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/widgets/content_of_onboarding_widget.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();
  final List<Widget> pages = [
    ContentOfOnboardingWidget(
      description: "onboarding1_desc",
      title: "onboarding1_title",
      imagePath: "assets/images/onboardin1.png",
    ),
    ContentOfOnboardingWidget(
      description: "onboarding2_desc",
      title: "onboarding2_title",
      imagePath: "assets/images/onboardin2.png",
    ),

    ContentOfOnboardingWidget(
      description: "onboarding3_desc",
      title: "onboarding3_title",
      imagePath: "assets/images/onboardin3.png",
    ),
  ];

  OnboardingBloc() : super(OnboardingInitial()) {
    on<NextPageEvent>(changeMethod);

    on<PreviousPageEvent>((event, emit) {
      if (state.index > 0) {
        pageController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        emit(SuccessState(index: state.index - 1));
      }
    });

    on<PageChangeEvent>((event, emit) {
      emit(SuccessState(index: event.index));
    });
  }

  FutureOr<void> changeMethod(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.index < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      emit(SuccessState(index: state.index + 1));
    }
  }
}
