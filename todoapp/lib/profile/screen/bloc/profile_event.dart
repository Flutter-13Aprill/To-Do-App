part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}




class LogOutevent extends ProfileEvent{
}

class changelanguage extends ProfileEvent{
  final Locale locale;

  changelanguage({required this.locale});
}


class Editpassword extends ProfileEvent{
  final String oldpassword;
  final String newpassword;

  Editpassword({required this.oldpassword, required this.newpassword});

 
  
}