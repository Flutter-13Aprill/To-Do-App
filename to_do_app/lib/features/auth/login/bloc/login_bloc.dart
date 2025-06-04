import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/theme/app_palette.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ChangeEvent>((event, emit) {
      if (event.isTrue == true) {
        
        emit(TrueState(AppPalette.purble));
      } else {
        
        emit(FalseState(AppPalette.darkPurble)); 
      }
    });
  }
}

