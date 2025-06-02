import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/text/app_text.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial(onLastPage: false, onFristPage: true)) {
    on<OnboardingPageChanged>((event, emit) {
      bool isLast = event.currentPage == AppText.onboardingContent.length - 1;
      bool onFristPage = event.currentPage == 0;
      emit(OnboardingInitial(onLastPage: isLast, onFristPage: onFristPage));
    });
  }
}

