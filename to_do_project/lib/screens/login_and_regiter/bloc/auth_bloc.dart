import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_project/data_layer/auth_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

    TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();

  final authGetit = GetIt.I.get<AuthLayer>();
  
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(loginMethod);
  }

  FutureOr<void> loginMethod(SignUpEvent event, Emitter<AuthState> emit) async {
    print("--------1");
    print(controllerEmail!.text);
    print(controllerPassword!.text);
    await authGetit.signUpMethod(
      email: controllerEmail!.text,
      password: controllerPassword!.text,
    );
    print("--------2");
    emit(SuccessState());
  }
  }

