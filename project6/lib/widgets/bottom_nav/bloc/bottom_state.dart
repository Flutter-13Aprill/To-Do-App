part of 'bottom_bloc.dart';

@immutable
sealed class BottomState {}

final class BottomInitial extends BottomState {}
final class SuccessState extends BottomState {}
