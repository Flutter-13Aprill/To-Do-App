part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class LoadingSplash extends SplashState{}

class FinishedSplash extends SplashState {}
