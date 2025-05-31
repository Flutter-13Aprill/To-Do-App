import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:getit/Repo/supabase_model_connect.dart';
import 'package:getit/Screens/navbar/nav_bar.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginButtonPressed>((event, emit) async {
      SupabaseConnect supabase = GetIt.I.get<SupabaseConnect>();

      if (formKey.currentState!.validate() &&
          await supabase.signInWithUsername(
            usernameController.text.trim(),
            passwordController.text.trim(),
          )) {
        Navigator.of(
          event.context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
        emit(LoginSuccessful()); // Reset the state after login
      } else {
        // If the form is not valid, you might want to show an error message
        ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
        emit(LoginFailure());
      }
    });
    on<ObscurePasswordClicked>((event, emit) {
      isPasswordVisible = !isPasswordVisible;
      emit(ObscurePasswordToggled());
    });
  }
}
