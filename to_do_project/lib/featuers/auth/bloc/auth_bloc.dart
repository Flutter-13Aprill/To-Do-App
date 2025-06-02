import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_project/featuers/auth/data/data_layer/auth_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final controllerName = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPass = TextEditingController();

  final authGetit = GetIt.I.get<AuthLayer>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<RegesterEvent>(signUp);

    on<LoginEvent>(signIn);
  }

  FutureOr<void> signUp(RegesterEvent event, Emitter<AuthState> emit) async {
    if (controllerPassword.text != controllerPass.text) {
      emit(ErrorState(msg: "Passwords do not match!"));
      return;
    }
    emit(LoadingSignUpState());
    try {
      await authGetit.signUpMethod(
        userName: controllerName.text,
        passowrd: controllerPassword.text,
      );
      print("Sign up successful for user: ${controllerName.text}");
      emit(SuccessState());
    } catch (e) {
      print("Sign up error: $e");
      emit(ErrorState(msg: e.toString()));
    }
  }

  FutureOr<void> signIn(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingLoginState());
    try {
      await authGetit.signInMethod(
        userName: controllerName.text,
        passowrd: controllerPassword.text,
      );
      print("Login successful for user: ${controllerName.text}");
      emit(SuccessState());
    } catch (e) {
      print("Login error: $e");
      emit(ErrorState(msg: e.toString()));
    }
  }

  @override
  Future<void> close() {
    controllerName.dispose();
    controllerPassword.dispose();
    controllerPass.dispose();
    return super.close();
  }
}
