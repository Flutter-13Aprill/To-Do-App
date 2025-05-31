part of 'start_bloc.dart';

@immutable
sealed class StartEvent {}

final class LoginButtonPressed extends StartEvent {
  final BuildContext context;
  LoginButtonPressed(this.context);
}

final class CreateAnAccountButtonPressed extends StartEvent {
  final BuildContext context;
  CreateAnAccountButtonPressed(this.context);
}

final class BackButtonPressed extends StartEvent {
  final BuildContext context;
  BackButtonPressed(this.context);
}
