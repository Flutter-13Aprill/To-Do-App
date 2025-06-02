part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ChnageName extends ProfileEvent {}

class UploadImgfromGallery extends ProfileEvent {}
