part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
class LoadUserProfile extends ProfileEvent {}

class UpdateUsername extends ProfileEvent {
  final String newUsername;
  const UpdateUsername(this.newUsername);
}

class UpdatePassword extends ProfileEvent {
  final String newPassword;
  const UpdatePassword(this.newPassword);
}
