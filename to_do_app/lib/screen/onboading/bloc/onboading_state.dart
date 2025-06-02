part of 'onboading_bloc.dart';

@immutable
sealed class OnboadingState {}

final class OnboadingInitial extends OnboadingState {}

final class SuccessState extends OnboadingState {}
