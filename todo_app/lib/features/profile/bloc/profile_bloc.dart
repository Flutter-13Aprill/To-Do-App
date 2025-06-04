import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/repo/supabase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  TextEditingController updatePasswordController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<LogOutEvent>(logOutMethod);
    on<ChangeNameEvent>(nameMethod);
    on<ChangePasswordEvent>(passwordMethod);
  }

  FutureOr<void> logOutMethod(
    LogOutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await SupabaseConnect.signOut();
    emit(SuccessState());
  }

  FutureOr<void> nameMethod(ChangeNameEvent event, Emitter<ProfileState> emit) {
    final email = "${updateNameController.text}@gmail.com";
    try {
      SupabaseConnect.updateEmail(email);
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }

  FutureOr<void> passwordMethod(
    ChangePasswordEvent event,
    Emitter<ProfileState> emit,
  ) {
    try {
      SupabaseConnect.updateEmail(updatePasswordController.text);
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }
}
