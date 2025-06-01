import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String userName = '';
  String password = '';
  String confirmPassword = '';
  bool? isValid;
  final formKey = GlobalKey<FormState>();

  final List<String> errors = [];

  final Map<String, Map<String, String>> errorMessages = {
    "email": {
      "emptyEmail": "Please enter your email",
      "invalidEmail": "Enter a valid email address",
    },
    "password": {
      "emptyPassword": "Please enter your password",
      "weakPassword":
          "Password must be 6+ chars and include upper, lower, digit, and special char",
    },
  };

  validatorEmail(value) {
    if (value == null || value.isEmpty) {
      errors.add(errorMessages["email"]!["emptyEmail"]!);
      return errorMessages["email"]!["emptyEmail"];
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
    );
    if (!emailRegex.hasMatch(value)) {
      errors.add(errorMessages["email"]!["invalidEmail"]!);
      return errorMessages["email"]!["invalidEmail"];
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
    on<SignUp>(signUp);
  }

  FutureOr<void> validate(Validate event, Emitter<AuthState> emit) {
    errors.clear();
    isValid = formKey.currentState!.validate();
    print("object $isValid");

    isValid! ? emit(AuthSuccessfully()) : emit(AuthError());
  }

  FutureOr<void> signUp(SignUp event, Emitter<AuthState> emit) {
    
  }
}
