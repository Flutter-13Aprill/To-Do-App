import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/layer_data/auth_layer.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/// Bloc to handle user authentication logic including sign-up and log-in.
///
/// Events handled:
/// - On [SignUpEvent], attempts to register a new user with the provided username and password.
///   Emits [SuccessState] on success or [ErrorState] with an error message on failure.
/// - On [LogInEvent], attempts to log in an existing user with the provided credentials.
///   Emits [SuccessState] on success or [ErrorState] with an error message on failure.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conpasswordController = TextEditingController();

  final authGetit = GetIt.I.get<AuthLayer>();

  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signupMethod);
    on<LogInEvent>(loginMethod);
  }

  FutureOr<void> signupMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final email = "${userNameController.text}@gmail.com";
    try {
      await authGetit.signUpMethod(
        email: email,
        password: passwordController.text,
      );
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }

  FutureOr<void> loginMethod(LogInEvent event, Emitter<AuthState> emit) async {
    final email = "${userNameController.text}@gmail.com";
    try {
      await authGetit.logInMethod(
        email: email,
        password: passwordController.text,
      );
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }
}
