import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/repository/supabase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SupabaseConnect authGetit = GetIt.I.get<SupabaseConnect>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>(signupMethod);
  }

  FutureOr<void> signupMethod(
    SignupEvent event,
    Emitter<SignupState> emit,
  ) async {
    final username = userController.text.trim();
    final password = passController.text.trim();
    final cofirmpass = confirmpassController.text.trim();
    if (password != cofirmpass) {
      emit(SignupErrorState(message: 'Passwords do not match'));
      return;
    }
    emit(SignupLoadingState());
    try {
      await authGetit.signUp(username: username, password: password);
      emit(SignupSuccessState());
    } catch (e) {
      emit(SignupErrorState(message: e.toString()));
    }
  }
}
