part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}
final class ChangeIndexSuccessfully extends OnBoardingState {}
final class BackSuccessfully extends OnBoardingState {}
final class NextSuccessfully extends OnBoardingState {}
