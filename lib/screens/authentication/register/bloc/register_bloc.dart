import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/layers/AppModel.dart';
import 'package:to_do_list/layers/authentication_layer.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final registerFormKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final authGetIt = GetIt.I.get<AuthenticationLayer>();
  final dataGetIt = GetIt.I.get<AppModelLayer>();

  RegisterBloc() : super(RegisterInitial()) {
    on<NewRegisterEvent>(registerMethod);
  }

  FutureOr<void> registerMethod(
    NewRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (registerFormKey.currentState!.validate()) {
      dataGetIt.users.contains(usernameController.text);
      await authGetIt.userSignUp(
        usernameController.text,
        passwordController.text,
      );
      emit(SuccefullRegisterState());
    } else {
      throw FormatException("Sign Up Failed");
    }
  }
}
