import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/theme/app_palette.dart';

part 'registertion_event.dart';
part 'registertion_state.dart';

class RegistertionBloc extends Bloc<RegistertionEvent, RegistertionState> {
  RegistertionBloc() : super(RegistertionInitial()) {
    on<ChangeEvent>((event, emit) {
      if (event.isTrue == true) {
        
        emit(TrueState(AppPalette.purble));
      } else {
        
        emit(FalseState(AppPalette.darkPurble)); 
      }
    });
  }
}
