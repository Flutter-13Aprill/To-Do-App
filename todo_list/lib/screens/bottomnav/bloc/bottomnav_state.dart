part of 'bottomnav_bloc.dart';

@immutable
sealed class BottomnavState {}

final class BottomnavInitial extends BottomnavState {}

final class SuccessState extends BottomnavState {}
