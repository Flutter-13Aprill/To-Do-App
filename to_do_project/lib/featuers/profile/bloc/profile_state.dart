part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SigningOutState extends ProfileState {}

final class SignOutSuccessState extends ProfileState {}

final class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState(this.message);
}

final class NavigateToAppSettingsState extends ProfileState {}

class ProfileUpdatedState extends ProfileState {}

class PasswordChangedState extends ProfileState {}
