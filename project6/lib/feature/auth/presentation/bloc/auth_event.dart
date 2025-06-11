part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class ValidateFormEvent extends AuthEvent {
  final GlobalKey<FormState> formKey;

  ValidateFormEvent({required this.formKey});
}

class SignUpEvent extends AuthEvent {}

class LogInEvent extends AuthEvent {}
