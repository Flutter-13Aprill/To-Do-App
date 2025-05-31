part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class ObscurePasswordClicked extends SignUpEvent {}

final class CheckPasswordStrength extends SignUpEvent {
  final String password;

  CheckPasswordStrength(this.password);
}

final class SignUpButtonPressed extends SignUpEvent {
  final BuildContext context;

  SignUpButtonPressed(this.context);
}
