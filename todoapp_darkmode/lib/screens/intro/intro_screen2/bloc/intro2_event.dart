part of 'intro2_bloc.dart';

@immutable
sealed class Intro2Event {}

final class ButtonPressed extends Intro2Event {}

final class BackButtonPressed extends Intro2Event {}