import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/feature/auth/data/data/data_layer/auth_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();
  final RegExp usernameRegex = RegExp(r'^[\u0621-\u064Aa-zA-Z0-9_]{3,20}$');
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^])[A-Za-z\d!@#\$&*~%^]{8,}$',
  );

  AuthBloc() : super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<ValidateFormEvent>(buttonValidate);
    on<SignUpEvent>(signUpMethod);
    on<LogInEvent>(logInMethod);
  }
  FutureOr<void> buttonValidate(
    ValidateFormEvent event,
    Emitter<AuthState> emit,
  ) {
    final isValid = event.formKey.currentState?.validate() ?? false;

    emit(AuthFormValidation(isValid: isValid));
  }

  FutureOr<void> signUpMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authGetit.signUpMethod(
        userName: userNameController.text,
        password: passwordController.text,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  FutureOr<void> logInMethod(LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authGetit.logInMethod(
        userName: userNameController.text,
        password: passwordController.text,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
