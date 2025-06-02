part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SuccessState extends SignupState {}
