import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      final isValid = _validate(event.email, state.password);
      emit(state.copyWith(email: event.email, isValid: isValid));
    });

    on<PasswordChanged>((event, emit) {
      final isValid = _validate(state.email, event.password);
      emit(state.copyWith(password: event.password, isValid: isValid));
    });

    on<LoginSubmitted>((event, emit) {});
  }

  bool _validate(String email, String password) {
    final emailValid = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
    final passwordValid = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
    ).hasMatch(password);
    return emailValid && passwordValid;
  }
}
