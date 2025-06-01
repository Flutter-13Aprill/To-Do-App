part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
 
// Event to signal that text in either field has changed,
// which will trigger the bloc to re-evaluate the button state.
class LoginFieldsChanged extends LoginEvent {}

// Event for when the login button is pressed.
class LoginButtonPressed extends LoginEvent {}