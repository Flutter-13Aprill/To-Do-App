import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/layer_data/auth_layer.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();

  SignupBloc() : super(SignupInitial()) {
    on<UsernameChanged>(onInputChanged);
    on<PasswordChanged>(onInputChanged);
    on<ConfirmPasswordChanged>(onInputChanged);
    on<SignUpEvent>(signupMethod);
  }

  FutureOr<void> onInputChanged(SignupEvent event, Emitter<SignupState> emit) {
    final username = usernameController.text;
    final password = passController.text;
    final confirmPassword = confirmPassController.text;

    if (username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      emit(SignupSuccess());
    } else {
      emit(SignupInitial());
    }
  }

  FutureOr<void> signupMethod(
    SignUpEvent event,
    Emitter<SignupState> emit,
  ) async {
    print("--------1");
    print(usernameController.text);
    print(passController.text);
    await authGetit.signUpMethod(
      email: "${usernameController.text}@gmail.com",
      password: passController.text,
    );
    print("--------2");
    emit(SignupSuccess());
  }
}
