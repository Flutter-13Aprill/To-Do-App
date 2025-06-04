import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/repository/supabase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SupabaseConnect authGetit = GetIt.I.get<SupabaseConnect>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmittedEvent>(loginMethod);
  }

  FutureOr<void> loginMethod(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      await authGetit.signIn(
        username: userController.text.trim(),
        password: passController.text.trim(),
      );
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }
}
