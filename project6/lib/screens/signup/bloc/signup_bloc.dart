import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project6/layer_data/auth_layer.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    String confirmPassword = '';
  bool isCorrect = false;
  final authGetit = GetIt.I.get<AuthLayer>();
  SignupBloc() : super(SignupInitial()) {
    on<CorrectEvent>(correctMethod);
    on<SubmitEvent>(submitMethod);
  }

  FutureOr<void> correctMethod(CorrectEvent event, Emitter<SignupState> emit) {
      isCorrect = event.isTrue;
    emit(SuccessState());

  }

  FutureOr<void> submitMethod(SubmitEvent event, Emitter<SignupState> emit) async{
 
    await authGetit.signUpMethod(username: usernameController.text, password: passwordController.text);
    emit(SuccessState());

  }
}
