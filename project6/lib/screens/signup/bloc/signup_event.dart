part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}
final class CorrectEvent extends SignupEvent{
  final bool isTrue;

  CorrectEvent({required this.isTrue});
}
final class SubmitEvent extends SignupEvent{}