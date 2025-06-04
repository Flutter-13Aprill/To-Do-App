part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessCharactersPasswordState extends AuthState {}

final class SuccessnumberPasswordState extends AuthState {}
