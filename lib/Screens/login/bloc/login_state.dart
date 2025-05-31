part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessful extends LoginState {}

final class LoginFailure extends LoginState {}

final class ObscurePasswordToggled extends LoginState {}
