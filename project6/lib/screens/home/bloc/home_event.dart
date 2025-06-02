part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class ChangePage extends HomeEvent{

  final int value;

  ChangePage({required this.value});

}


final class AddEvent extends HomeEvent{}
final class  SupaEvent extends HomeEvent{}