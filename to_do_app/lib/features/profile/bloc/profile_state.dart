part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel user;
  final TaskStats taskStats;

  const ProfileLoaded({required this.user, required this.taskStats});
}

class ProfileError extends ProfileState {}

class PasswordUpdated extends ProfileState {}

class TaskStats {
  final int done;
  final int left;
  TaskStats(this.done, this.left);
}
