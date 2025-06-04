import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:getit/Screens/login/login_screen.dart';
import 'package:getit/Screens/signup/sign_up_screen.dart';
import 'package:meta/meta.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartInitial()) {
    on<StartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginButtonPressed>((event, emit) {
      Navigator.of(
        event.context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    on<CreateAnAccountButtonPressed>((event, emit) {
      Navigator.of(
        event.context,
      ).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
    });
    on<BackButtonPressed>((event, emit) {
      Navigator.of(event.context).pop();
    });
  }
}
