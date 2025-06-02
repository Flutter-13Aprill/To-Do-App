part of 'intro1_bloc.dart';

@immutable
sealed class Intro1Event {}

final class StartTimer extends Intro1Event {}