import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class UsernameChanged extends ProfileEvent {
  final String username;

  const UsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends ProfileEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class ImageChanged extends ProfileEvent {
  final String imagePath;

  const ImageChanged(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}

class ProfileSubmitted extends ProfileEvent {}
