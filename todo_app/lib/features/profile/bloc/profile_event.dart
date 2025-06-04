part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class LogOutEvent extends ProfileEvent {}

class ChangeNameEvent extends ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {}
