part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class HasEnterValue extends AuthEvent{
  final String text;
  final bool isPassword;
  final bool isConfirmationPassword;

  HasEnterValue({required this.text, required this.isPassword, required this.isConfirmationPassword});
}

class HasEnterAllFields extends AuthEvent {
  final bool isFilledAllFields; 

  HasEnterAllFields({required this.isFilledAllFields});
}

class SignUpEvent extends AuthEvent{
  final String username;
  final String password;

  SignUpEvent({required this.username, required this.password});
}


class LogInEvent extends AuthEvent {
  final String username;
  final String password;

  LogInEvent({required this.username, required this.password});
}
