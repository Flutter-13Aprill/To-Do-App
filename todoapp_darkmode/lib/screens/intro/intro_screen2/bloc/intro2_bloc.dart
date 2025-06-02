import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro2_event.dart';
part 'intro2_state.dart';

class Intro2Bloc extends Bloc<Intro2Event, Intro2State> {
  Intro2Bloc() : super(Intro2Initial()) {
    on<ButtonPressed>((event, emit) {
      emit(ButtonAlreadyPressed());
    });
     on<BackButtonPressed>((event, emit) {
      emit(BackButtonAlreadyPressed());
    });
  }
}
