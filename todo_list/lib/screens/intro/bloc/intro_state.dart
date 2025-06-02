part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {}

final class LoadingState extends IntroState {}

final class SuccessLoadingState extends IntroState {}
