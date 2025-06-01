part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isValid;

  LoginState({
    required this.email,
    required this.password,
    required this.isValid,
  });

  factory LoginState.initial() {
    return LoginState(email: '', password: '', isValid: false);
  }

  LoginState copyWith({String? email, String? password, bool? isValid}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}
