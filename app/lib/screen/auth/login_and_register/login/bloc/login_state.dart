part of 'login_bloc.dart';

@immutable
sealed class LoginState {}


// Initial state, and also the state that carries the button's enabled status.
class LoginInitial extends LoginState {
  final bool isButtonEnabled;

  LoginInitial({this.isButtonEnabled = false});

  @override
  List<Object?> get props => [isButtonEnabled]; // Required for equality checks in Bloc
}

// You might still want a loading/success/failure state for the actual login process.
// Keeping them for future use, even if not fully implemented in this iteration.
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}