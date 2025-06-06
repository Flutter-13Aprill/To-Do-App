part of 'intro_bloc.dart';

@immutable
sealed class IntroEvent {}

class SkipIntroEvent extends IntroEvent {}
