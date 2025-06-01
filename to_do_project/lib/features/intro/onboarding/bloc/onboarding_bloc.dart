import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required int totalPages})
    : super(OnboardingState(currentPage: 0, totalPages: totalPages)) {
    on<OnboardingPageChanged>((event, emit) {
      emit(state.copyWith(currentPage: event.index));
    });

    on<OnboardingNextPressed>((event, emit) {
      if (state.currentPage < state.totalPages - 1) {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });

    on<OnboardingBackPressed>((event, emit) {
      if (state.currentPage > 0) {
        emit(state.copyWith(currentPage: state.currentPage - 1));
      }
    });
  }
}
