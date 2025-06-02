part of 'registertion_bloc.dart';

@immutable
sealed class RegistertionEvent {}
class ChangeEvent extends RegistertionEvent {
final bool isTrue;

ChangeEvent(this.isTrue);
}
