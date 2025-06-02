part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegesterEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}
