part of 'registertion_bloc.dart';

@immutable
sealed class RegistertionState {}

final class RegistertionInitial extends RegistertionState {}
final class TrueState extends RegistertionState {
final Color buttonColor;

TrueState(this.buttonColor);
}
final class FalseState extends RegistertionState {
final Color buttonColor;

FalseState(this.buttonColor);
}