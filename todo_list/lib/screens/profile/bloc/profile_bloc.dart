import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/repo/supabase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ChanegPassEvent>(changePass);
  }

  FutureOr<void> changePass(
    ChanegPassEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(LoadingState());
    try {
      await SupabaseConnect.changeUserPassword(
        oldPassword: oldPassController.text,
        newPassword: newPassController.text,
      );
      emit(SuccessState());
    } catch (_) {
      emit(ErrorState());
    }
  }
}
