part of 'registor_bloc.dart';

@immutable
sealed class RegistorEvent {}

final class RegistorSubmitted extends RegistorEvent {
  final String email;
  final String password;

  RegistorSubmitted(this.email, this.password);
}

