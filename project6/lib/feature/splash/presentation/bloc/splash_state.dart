part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoaded extends SplashState {}

final class FirstTimeUseApp extends SplashState {}

final class NotFirstTimeUseApp extends SplashState {}
