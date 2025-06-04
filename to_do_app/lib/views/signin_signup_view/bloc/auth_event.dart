part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Validate extends AuthEvent {}
class Authenticate extends AuthEvent {}
