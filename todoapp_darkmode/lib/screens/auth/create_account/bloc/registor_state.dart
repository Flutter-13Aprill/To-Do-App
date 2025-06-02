part of 'registor_bloc.dart';

@immutable
sealed class RegistorState {}

final class RegistorInitial extends RegistorState {}

final class RegistorLoading extends RegistorState {}

final class RegistorSuccess extends RegistorState {}

final class RegistorFailure extends RegistorState {
  final String message;
  RegistorFailure(this.message);
}

