import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboading_event.dart';
part 'onboading_state.dart';

class OnboadingBloc extends Bloc<OnboadingEvent, OnboadingState> {
  // Controller to manage page navigation in PageView
  PageController pageController = PageController();
  // Tracks the current page index
  int imgValue = 0;

  String mainText = "Manage your tasks";

  String subText =
      "You can easily manage all of your daily\ntasks in DoMe for free";

  OnboadingBloc() : super(OnboadingInitial()) {
    on<NextIntro>(nextIntroMethod);
    on<BackIntro>(backIntroMethod);
  }

  FutureOr<void> nextIntroMethod(
    NextIntro event,
    Emitter<OnboadingState> emit,
  ) {
    pageController.animateToPage(
      imgValue = imgValue + 1,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    if (imgValue == 0) {
      mainText = "Manage your tasks";
      subText =
          "You can easily manage all of your daily\ntasks in DoMe for free";
    }
    if (imgValue == 1) {
      mainText = "Create daily routine";
      subText =
          "In Uptodo  you can create your\npersonalized routine to stay productive";
    }
    if (imgValue == 2) {
      mainText = "Orgonaize your tasks";
      subText =
          "You can organize your daily tasks by\nadding your tasks into separate categories";
    }
    emit(SuccessState());
  }

  FutureOr<void> backIntroMethod(
    BackIntro event,
    Emitter<OnboadingState> emit,
  ) {
    if (imgValue != 0) {
      pageController.animateToPage(
        imgValue = imgValue - 1,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
      if (imgValue == 0) {
        mainText = "Manage your tasks".tr();
        subText =
            "You can easily manage all of your daily\ntasks in DoMe for free"
                .tr();
      }
      if (imgValue == 1) {
        mainText = "Create daily routine".tr();
        subText =
            "In Uptodo  you can create your\npersonalized routine to stay productive"
                .tr();
      }
      if (imgValue == 2) {
        mainText = "Orgonaize your tasks".tr();
        subText =
            "You can organize your daily tasks by\nadding your tasks into separate categories"
                .tr();
      }
      emit(SuccessState());
    }
  }
}
