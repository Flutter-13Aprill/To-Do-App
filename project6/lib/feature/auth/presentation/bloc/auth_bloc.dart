import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final formKey=GlobalKey<FormState>();
  final formKey2=GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
  }
}
