import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getit/Screens/start/start_screen.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  PageController pageController = PageController();
  int currentPage = 0;
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeOnboardingPage>((event, emit) {
      emit(OnboardingPageChanged());
    });
    on<NextButtonPressed>((event, emit) {
      if (currentPage < 2) {
        currentPage++;
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Navigator.of(
          event.context,
        ).push(MaterialPageRoute(builder: (context) => StartScreen()));
      }
      emit(OnboardingPageChanged());
    });
    on<PreviousButtonPressed>((event, emit) {
      if (currentPage > 0) {
        currentPage--;
        pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(OnboardingPageChanged());
    });
    on<SkipOnboarding>((event, emit) {
      Navigator.of(
        event.context,
      ).push(MaterialPageRoute(builder: (context) => StartScreen()));
      emit(OnboardingSkipped());
    });
  }
}
