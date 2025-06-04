import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:onboarding_screen_bloc/screens/bloc/onboarding_events.dart';
// import 'package:onboarding_screen_bloc/screens/bloc/onboarding_states.dart';
import 'package:to_do_project/screens/intro/bloc/onboarding_events.dart';
import 'package:to_do_project/screens/intro/bloc/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  OnboardingBloc() : super(OnboardingStates()) {
    on<OnboardingEvents>((event, emit) {
      return emit(OnboardingStates(pageIndex: state.pageIndex));
    });
  }
}
