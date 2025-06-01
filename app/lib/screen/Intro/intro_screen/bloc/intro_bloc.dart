import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<IntroEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(IntroNavigateToOnboarding());
    });
  }
}
