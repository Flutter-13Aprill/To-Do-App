part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class Profilelogout extends ProfileState{}

final class Profileloding extends ProfileState{}
final class Langugechange extends ProfileState{
  final Locale locale;

  Langugechange({required this.locale}); 
}

final class changepasswordsucssfuil extends ProfileState{}
