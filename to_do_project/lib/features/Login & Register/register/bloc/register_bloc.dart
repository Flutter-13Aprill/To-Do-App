import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initial()) {
    on<UsernameChanged>((event, emit) {
      final username = event.username;
      final password = state.password;
      final confirmPassword = state.confirmPassword;

      String? usernameError;
      if (username.isEmpty) {
        usernameError = 'Username cannot be empty';
      } else if (!RegExp(r'^[a-zA-Z0-9]{6,}$').hasMatch(username)) {
        usernameError = 'Use letters/numbers, at least 6 characters';
      }

      final isValid = _validate(
        username: username,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(
        state.copyWith(
          username: username,
          usernameError: usernameError,
          isValid: isValid,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      final username = state.username;
      final password = event.password;
      final confirmPassword = state.confirmPassword;

      String? passwordError;
      if (password.isEmpty) {
        passwordError = 'Password cannot be empty';
      } else if (!RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
      ).hasMatch(password)) {
        passwordError = 'Must contain letters & numbers (min 6 chars)';
      }

      final isValid = _validate(
        username: username,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(
        state.copyWith(
          password: password,
          passwordError: passwordError,
          isValid: isValid,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      final username = state.username;
      final password = state.password;
      final confirmPassword = event.confirmPassword;

      String? confirmPasswordError;
      if (confirmPassword != password) {
        confirmPasswordError = 'Passwords do not match';
      }

      final isValid = _validate(
        username: username,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          confirmPasswordError: confirmPasswordError,
          isValid: isValid,
        ),
      );
    });
  }

  bool _validate({
    required String username,
    required String password,
    required String confirmPassword,
  }) {
    final usernameValid = RegExp(r'^[a-zA-Z0-9]{6,}$').hasMatch(username);
    final passwordValid = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
    ).hasMatch(password);
    final match = password == confirmPassword;

    return usernameValid && passwordValid && match;
  }
}
