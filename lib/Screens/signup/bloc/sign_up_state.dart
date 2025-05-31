part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class ObscurePasswordToggled extends SignUpState {}

final class PasswordStrengthChecked extends SignUpState {}

final class SignUpSuccessful extends SignUpState {}

final class SignUpFailure extends SignUpState {}
