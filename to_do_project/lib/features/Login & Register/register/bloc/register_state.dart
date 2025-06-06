part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String username;
  final String password;
  final String confirmPassword;
  final bool isValid;

  final String? usernameError;
  final String? passwordError;
  final String? confirmPasswordError;

  const RegisterState({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.isValid,
    this.usernameError,
    this.passwordError,
    this.confirmPasswordError,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      username: '',
      password: '',
      confirmPassword: '',
      isValid: false,
      usernameError: null,
      passwordError: null,
      confirmPasswordError: null,
    );
  }

  RegisterState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    bool? isValid,
    String? usernameError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      usernameError: usernameError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}
