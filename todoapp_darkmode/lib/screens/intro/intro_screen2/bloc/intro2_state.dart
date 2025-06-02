part of 'intro2_bloc.dart';

@immutable
sealed class Intro2State {}

final class Intro2Initial extends Intro2State {}

final class ButtonAlreadyPressed extends Intro2State{}

final class BackButtonAlreadyPressed extends Intro2State {}