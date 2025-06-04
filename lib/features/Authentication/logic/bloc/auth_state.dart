part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessEnteringFieldsState extends AuthState {}

final class SuccessEnteringAllFieldsState extends AuthState{}

final class SuccessCreatingAccount extends AuthState {
  final String message;
  SuccessCreatingAccount({required this.message});
}

final class ErrorCreatingAccount extends AuthState {
  final String message;

  ErrorCreatingAccount({required this.message});
}

final class SuccessLogInState extends AuthState {}

final class ErrorLogInState extends AuthState {
  final String message;

  ErrorLogInState({required this.message});
}
