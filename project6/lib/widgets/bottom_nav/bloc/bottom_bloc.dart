import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_event.dart';
part 'bottom_state.dart';

class BottomBloc extends Bloc<BottomEvent, BottomState> {

  int currentIndex = 0;

  BottomBloc() : super(BottomInitial()) {
    on<ChangePage>(pageChanger);
  }

  

  FutureOr<void> pageChanger(ChangePage event, Emitter<BottomState> emit) {
    
    currentIndex = event.value;
    emit(SuccessState());
 
  }
}
