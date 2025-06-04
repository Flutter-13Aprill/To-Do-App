import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/features/authentication/data/auth_data_layer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode usernameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmationPasswordNode = FocusNode();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();

  bool isFilledAllFields = false;

  final authGetit = GetIt.I.get<AuthDataLayer>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HasEnterValue>(hasEnterValue);

    on<HasEnterAllFields>(hasEnteredAllFields);

    on<SignUpEvent>(signUp);

    on<LogInEvent>(signIn);
  }

  FutureOr<void> hasEnteredAllFields(HasEnterAllFields event, Emitter<AuthState> emit) {
    isFilledAllFields = event.isFilledAllFields;
    emit(SuccessEnteringAllFieldsState());
  }

  FutureOr<void> hasEnterValue(HasEnterValue event, Emitter<AuthState> emit) {

    if(event.isPassword && !event.isConfirmationPassword){
      passwordController.text = event.text;
    }else if (event.isPassword && event.isConfirmationPassword){
      confirmationPasswordController.text = event.text;
    }else{
      usernameController.text = event.text;
    }

  }

  FutureOr<void> signUp(SignUpEvent event, Emitter<AuthState> emit) async{

    try{
      
      usernameController.clear();
      passwordController.clear();
      confirmationPasswordController.clear();
      await authGetit.getItSignUp(username: event.username , password: event.password);

      emit(SuccessCreatingAccount(message: 'You have created an account'));
    }catch(error){
      emit(ErrorCreatingAccount(message: error.toString()));
    }
  }

  FutureOr<void> signIn(LogInEvent event, Emitter<AuthState> emit) async{
    
    try{
      
      usernameController.clear();
      passwordController.clear();
      
      await authGetit.getItSignIn(username: event.username , password: event.password);
      emit(SuccessLogInState());
    }catch(error){
      emit(ErrorLogInState(message: error.toString()));
    }
  }
}
