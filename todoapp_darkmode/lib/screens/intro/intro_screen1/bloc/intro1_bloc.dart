import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro1_event.dart';
part 'intro1_state.dart';

class Intro1Bloc extends Bloc<Intro1Event, Intro1State> {
  Intro1Bloc() : super(Intro1Initial()) {
    on<StartTimer>((event, emit) async {
     await Future.delayed(Duration(seconds: 3));
     emit(Intro1Done());
    });
  }
}
