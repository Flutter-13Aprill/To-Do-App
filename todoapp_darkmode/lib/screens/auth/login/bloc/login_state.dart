part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class EmailInputGoesThrough extends LoginState {}
final class PassWordInputGouesThrough extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
final class LoginSuccess extends LoginState {}

