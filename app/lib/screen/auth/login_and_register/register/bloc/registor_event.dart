part of 'registor_bloc.dart';

@immutable
sealed class RegistorEvent {}

// Event to signal that text in any registration field has changed.
class RegisterFieldsChanged extends RegistorEvent {} 

// Event for when the register button is pressed.
class RegisterButtonPressed extends RegistorEvent {}  