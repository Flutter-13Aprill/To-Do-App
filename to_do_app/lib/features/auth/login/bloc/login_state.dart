part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class TrueState extends LoginState {
final Color buttonColor;

TrueState(this.buttonColor);
}
final class FalseState extends LoginState {
final Color buttonColor;

FalseState(this.buttonColor);
}
