part of 'onboading_bloc.dart';

@immutable
sealed class OnboadingEvent {}

class NextIntro extends OnboadingEvent {}

class BackIntro extends OnboadingEvent {}
