import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  int currentIndex = 0;
  String imagePath = "lib/assets/images/onBoarding/1.png";
  PageController onboardingController = PageController(initialPage: 0);
  final Map<String, Map<String, String>> contents = {
    "screen1": {
      "title": "Manage your tasks",
      "subTitle":
          "You can easily manage all of your daily tasks in DoMe for free",
    },
    "screen2": {
      "title": "Create daily routine",
      "subTitle":
          "In UpTodo  you can create your personalized routine to stay productive",
    },
    "screen3": {
      "title": "Organize your tasks",
      "subTitle":
          "You can organize your daily tasks by adding your tasks into separate categories",
    },
    "screen4": {
      "title": "Welcome to UpTodo",
      "subTitle":
          "Please login to your account or create new account to continue",
    },
  };
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {});
    on<ChangeCurrentIndex>(changeCurrentIndex);
    on<NextView>(nextView);
    on<BackView>(backView);
  }

  FutureOr<void> changeCurrentIndex(
    ChangeCurrentIndex event,
    Emitter<OnBoardingState> emit,
  ) {
    currentIndex = event.index;
    imagePath = "lib/assets/images/onBoarding/${currentIndex + 1}.png";
    emit(ChangeIndexSuccessfully());
  }

  FutureOr<void> nextView(NextView event, Emitter<OnBoardingState> emit) {
    if (currentIndex < contents.length) {
      currentIndex = currentIndex + 1;
      emit(NextSuccessfully());
    }
  }

  FutureOr<void> backView(BackView event, Emitter<OnBoardingState> emit) {
    if (currentIndex > 0) {
      currentIndex = currentIndex - 1;
      emit(BackSuccessfully());
    }
  }
}
