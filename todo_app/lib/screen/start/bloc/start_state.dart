part of 'start_bloc.dart';

@immutable
sealed class StartState {}

final class StartInitial extends StartState {}

final class NavigateToLoginState extends StartState {}

final class NavigateToCreateAccountState extends StartState {}
