part of 'bottom_bloc.dart';

@immutable
sealed class BottomEvent {}

final class ChangePage extends BottomEvent{

  final int value;

  ChangePage({required this.value});

}