import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<SkipIntroEvent>(createMethod);
  }

  FutureOr<void> createMethod(
    SkipIntroEvent event,
    Emitter<IntroState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 6));
    emit(SuccessLoadingState());
  }
}
