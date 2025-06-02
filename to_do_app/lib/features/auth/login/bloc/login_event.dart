part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class ChangeEvent extends LoginEvent {
final bool isTrue;

ChangeEvent(this.isTrue);
}
