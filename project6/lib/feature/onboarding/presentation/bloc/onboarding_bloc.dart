import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/core/service/local_storage.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController controller = PageController();
  int currentPage = 0;
  final getItData = GetIt.I.get<LocalStorage>();

  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});
    on<NextPageEvent>(moveToNextPage);
    on<PreviousPageEvent>(backToPreviousPage);
    on<UpdateCurrentPageEvent>(currentPageMethod);
    on<CompleteOnboardingEvent>(completeOnboarding);
  }

  FutureOr<void> moveToNextPage(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> backToPreviousPage(
    PreviousPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> currentPageMethod(
    UpdateCurrentPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    currentPage = event.pageIndex;
    emit(OnboardingPageState(currentPage: event.pageIndex));
  }

  FutureOr<void> completeOnboarding(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    getItData.saveData(key: "isOnboardingVisited", value: true);
    emit(OnboardingCompleted());
  }
}
