part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class UsernameChanged extends RegisterEvent {
  final String username;
  UsernameChanged(this.username);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}
