import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'introbording_event.dart';
part 'introbording_state.dart';

class IntrobordingBloc extends Bloc<IntrobordingEvent, IntrobordingState> {
  IntrobordingBloc() : super(IntrobordingInitial()) {
    on<changepage>(onchangepage);
  }

  FutureOr<void> onchangepage(changepage event, Emitter<IntrobordingState> emit) {
    final int index=event.index;
    emit(changethepagestate(index: index));
  }
}
