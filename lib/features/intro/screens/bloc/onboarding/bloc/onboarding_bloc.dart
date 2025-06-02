import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingInitial(0)) {
    on<OnboardingPageChanged>((event, emit) {
      emit(OnboardingInitial(event.index));
    });
  }
}
