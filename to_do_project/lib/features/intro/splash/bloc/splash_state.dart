part of 'splash_bloc.dart';

@immutable
sealed class IntroState {}

class SplashInitial extends IntroState {}

class NavigateToOnboarding extends IntroState {}
