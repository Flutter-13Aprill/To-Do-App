import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/layer_data/auth_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String userName = '';
  String password = '';
  String confirmPassword = '';
  bool? isValid;
  bool isSignin = true;
  final authGetIt = GetIt.I.get<AuthLayer>();
  bool isAuth=false;

  final formKey = GlobalKey<FormState>();

  final List<String> errors = [];

  final Map<String, Map<String, String>> errorMessages = {
    "username": {"emptyUsername": "Please enter your UserName"},
    "password": {
      "emptyPassword": "Please enter your password",
      "weakPassword":
          "Password must be 6+ chars and include upper, lower, digit, and special char",
    },
  };

  validatorUserName(value) {
    if (value == null || value.isEmpty) {
      errors.add(errorMessages["username"]!["emptyUsername"]!);
      return errorMessages["username"]!["emptyUsername"];
    }

    return null;
  }

  validatorPassword(value) {
    if (value == null || value.isEmpty) {
      errors.add(errorMessages["password"]!["emptyPassword"]!);

      return errorMessages["password"]!["emptyPassword"];
    }
    // Min 6 chars, at least one uppercase, one lowercase, one digit, one special char
    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      errors.add(errorMessages["password"]!["weakPassword"]!);

      return errorMessages["password"]!["weakPassword"];
    }

    return null;
  }

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<Validate>(validate);
    on<Authenticate>(authenticate);
  }

  FutureOr<void> validate(Validate event, Emitter<AuthState> emit) {
    errors.clear();
    isValid = formKey.currentState!.validate();

    isValid! ? emit(AuthSuccessfully()) : emit(AuthError());
  }

  FutureOr<void> authenticate(Authenticate event, Emitter<AuthState> emit)async {
    if (isValid != null && isValid!) {
      if (isSignin) {
       isAuth=  await authGetIt.signInMethod(userName: userName, password: password);
       
      } else {
     isAuth=  await authGetIt.signUpMethod(
          userName: userName,
          password: password,
          confirmPassword: confirmPassword,
        );
      }
      if(isAuth == true){
        emit(AuthSuccessfully());
      }
    }
  }
}
