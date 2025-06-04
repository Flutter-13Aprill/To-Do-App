import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit/Repo/supabase_model_connect.dart';
import 'package:getit/Screens/navbar/nav_bar.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SupabaseConnect supabase = GetIt.I.get<SupabaseConnect>();
  bool isPasswordVisible = true;
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ObscurePasswordClicked>((event, emit) {
      isPasswordVisible = !isPasswordVisible;
      emit(ObscurePasswordToggled());
    });
    on<CheckPasswordStrength>((event, emit) {
      emit(PasswordStrengthChecked());
    });
    on<SignUpButtonPressed>((event, emit) async {
      log("signUp clicked");
      if (formKey.currentState!.validate()) {
        try {
          await supabase.signUpNewUser(
            usernameController.text.trim(),
            passwordController.text.trim(),
          );
          // ignore: use_build_context_synchronously
          Navigator.of(
            event.context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
          emit(SignUpSuccessful()); // Reset the state after login
        } catch (e) {
          log("Error signing up: $e");
          ScaffoldMessenger.of(
            event.context,
          ).showSnackBar(SnackBar(content: Text('Sign up failed: $e')));
          emit(SignUpFailure());
          return;
        }
      } else {
        // If the form is not valid, you might want to show an error message
        ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
        emit(SignUpFailure());
      }
    });
  }
}
