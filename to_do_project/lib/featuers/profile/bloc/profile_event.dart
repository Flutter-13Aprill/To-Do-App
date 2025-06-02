part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileSignOutEvent extends ProfileEvent {}

class ProfileAppSettingsTapped extends ProfileEvent {}

class UpdateNameEvent extends ProfileEvent {
  final String newName;
  UpdateNameEvent(this.newName);
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;

  ChangePasswordEvent({required this.oldPassword, required this.newPassword});
}
