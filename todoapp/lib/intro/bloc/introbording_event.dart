part of 'introbording_bloc.dart';

@immutable
sealed class IntrobordingEvent {}
class changepage extends IntrobordingEvent{
  final int index;

  changepage({required this.index});
  
}