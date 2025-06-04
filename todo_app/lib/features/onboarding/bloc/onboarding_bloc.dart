import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

/// Bloc that manages the onboarding flow using page navigation.
///
///Events handled:
/// - [PageChanged]: Updates the current page index when the page changes.
/// - [NextPage]: Navigates to the next onboarding page.
/// - [PreviousPage]: Navigates to the previous onboarding page.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController =
      PageController(); // Controller for pages
  int pageNumber = 0;
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});

    on<PageChanged>(pageChangedMethod);
    on<NextPage>(nextPageMethod);
    on<PreviousPage>(previousMethod);
  }

  FutureOr<void> pageChangedMethod(
    PageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    pageNumber = event.pageIndex;
    emit(SuccessState(pageNumber: pageNumber));
  }

  FutureOr<void> nextPageMethod(NextPage event, Emitter<OnboardingState> emit) {
    final nextPage = pageNumber + 1;
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    emit(SuccessState(pageNumber: nextPage));
  }

  FutureOr<void> previousMethod(
    PreviousPage event,
    Emitter<OnboardingState> emit,
  ) {
    final prevPage = pageNumber - 1;
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    emit(SuccessState(pageNumber: prevPage));
  }
}
