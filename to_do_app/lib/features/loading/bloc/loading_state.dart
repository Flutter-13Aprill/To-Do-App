part of 'loading_bloc.dart';

@immutable
sealed class LoadingState {}

final class LoadingInitial extends LoadingState {}

final class SuccessState extends LoadingState {}

final class ErrorState extends LoadingState {}
