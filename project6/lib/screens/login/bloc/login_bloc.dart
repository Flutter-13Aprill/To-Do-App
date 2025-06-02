import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project6/layer_data/auth_layer.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  bool isCorrect = false;
    final authGetit = GetIt.I.get<AuthLayer>();

  LoginBloc() : super(LoginInitial()) {
    on<CorrectEvent>(changerMethod);
    on<SubmitEvent>(submitMethod);

  }

  FutureOr<void> changerMethod(CorrectEvent event, Emitter<LoginState> emit) {

     isCorrect = event.isTrue;
    emit(SuccessState());

  }

  FutureOr<void> submitMethod(SubmitEvent event, Emitter<LoginState> emit) async{

    
   await authGetit.loginMethod(username: usernameController.text, password: passwordController.text);

    emit(SuccessState());

  }
}
