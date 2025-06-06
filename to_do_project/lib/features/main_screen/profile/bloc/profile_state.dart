import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String username;
  final String password;
  final String imagePath;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const ProfileState({
    required this.username,
    required this.password,
    required this.imagePath,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  factory ProfileState.initial() {
    return const ProfileState(username: '', password: '', imagePath: '');
  }

  ProfileState copyWith({
    String? username,
    String? password,
    String? imagePath,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return ProfileState(
      username: username ?? this.username,
      password: password ?? this.password,
      imagePath: imagePath ?? this.imagePath,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    username,
    password,
    imagePath,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}
