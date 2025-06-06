part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class UsernameChanged extends SignupEvent {
  final String username;
  UsernameChanged(this.username);
}

class PasswordChanged extends SignupEvent {
  final String password;
  PasswordChanged(this.password);
}

class ConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class SignUpEvent extends SignupEvent {}
