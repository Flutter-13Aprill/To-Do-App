part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupSubmittedEvent extends SignupEvent {}
