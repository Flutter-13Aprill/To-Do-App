import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro3_event.dart';
part 'intro3_state.dart';

class Intro3Bloc extends Bloc<Intro3Event, Intro3State> {
  Intro3Bloc() : super(Intro3Initial()) {
    on<Intro3Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
