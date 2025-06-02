import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int currentIndex = 0;
  final PageController imagePageController = PageController(
    initialPage: 0
  );
  final PageController textPageController = PageController(
    initialPage: 0
  );

  

  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {
    });

    on<PageChangedEvent>(pageChangedEvent);

  }

  FutureOr<void> pageChangedEvent(PageChangedEvent event, Emitter<OnboardingState> emit) {
    currentIndex = event.index;
    emit(SuccessChangePageState());
  }
}
