part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


final class CorrectEvent extends LoginEvent{
  final bool isTrue;

  CorrectEvent({required this.isTrue});
}
final class SubmitEvent extends LoginEvent{}