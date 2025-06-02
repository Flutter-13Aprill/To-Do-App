import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  GlobalKey registerFormKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<NewRegisterEvent>(registeringMethod);
  }

  FutureOr<void> registeringMethod(
    NewRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {}
}
