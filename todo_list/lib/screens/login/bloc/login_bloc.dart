import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/layer_data/auth_layer.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authGetit = GetIt.I.get<AuthLayer>();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<UsernameChanged>(onInputChanged);
    on<PasswordChanged>(onInputChanged);
    on<LoginButtonPressed>(signinMethod);
  }

  FutureOr<void> onInputChanged(LoginEvent event, Emitter<LoginState> emit) {
    final username = usernameController.text;
    final password = passController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      emit(InputSuccess());
    } else {
      emit(LoginInitial());
    }
  }

  FutureOr<void> signinMethod(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await authGetit.signInMethod(
        email: "${usernameController.text}@gmail.com",
        password: passController.text,
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
