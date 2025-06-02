part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ChnageNamgeState extends ProfileState {}

final class SuccessUploadImg extends ProfileState {
  final File image;

  SuccessUploadImg({required this.image});
}
