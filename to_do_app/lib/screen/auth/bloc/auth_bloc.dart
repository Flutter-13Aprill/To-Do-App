import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/layer_data/auth_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();

  AuthBloc() : super(AuthInitial()) {
    on<CheckCharactersPassword>(checkCharactersPasswordMethod);
    on<SignUpEvent>(signUpEventMethod);
    on<SignInEvent>(signInEventMethod);
  }

  FutureOr<void> checkCharactersPasswordMethod(
    CheckCharactersPassword event,
    Emitter<AuthState> emit,
  ) {
    if (event.value.length >= 6) {
      emit(SuccessCharactersPasswordState());
    }
    if (event.value.contains(RegExp(r'\d'))) {
      emit(SuccessnumberPasswordState());
    }

    return null;
  }

  FutureOr<void> signUpEventMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    await authGetit.signUpMethod(
      email: "${emailController.text}@gmail.com",
      password: passController.text,
    );
  }

  FutureOr<void> signInEventMethod(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    await authGetit.signInMethod(
      email: "${emailController.text}@gmail.com",
      password: passController.text,
    );
  }
}
