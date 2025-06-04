import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  int currentIndex = 0;
  
  CalendarBloc() : super(CalendarInitial()) {
    on<ChangTabEvent>(changeTabs);
  }

  FutureOr<void> changeTabs(ChangTabEvent event, Emitter<CalendarState> emit) {
    
    currentIndex = event.tabIndex;
    emit(SuccessState());

  }
}
