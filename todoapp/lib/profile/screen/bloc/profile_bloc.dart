import 'dart:async';

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/core/di/locetor.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/repo/authrepo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final auth = locetor<Authrepo>();
  ProfileBloc() : super(ProfileInitial()) {
    on<LogOutevent>(logout);
    on<changelanguage>(changelan);
    on<Editpassword>(editpassword);
  }

  FutureOr<void> logout(ProfileEvent event, Emitter<ProfileState> emit) async {
    emit(Profileloding());
    await auth!.logout();
    emit(Profilelogout());
  }

  FutureOr<void> changelan(
    changelanguage event,
    Emitter<ProfileState> emit,
  ) async {
    await EasyLocalization.of(globalContext)!.setLocale(event.locale);
    emit(Langugechange(locale: event.locale));
  }

  FutureOr<void> editpassword(
    Editpassword event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await auth!.changepassword(event.oldpassword, event.newpassword);
      emit(changepasswordsucssfuil());
    } catch (e) {
      print(e);
    }
  }
}
