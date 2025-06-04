part of 'start_bloc.dart';

@immutable
sealed class StartEvent {}

class LoginPressedEvent extends StartEvent {}

class CreateAccountPressedEvent extends StartEvent {}
