import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_project/core/repo/supabase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileSignOutEvent>(_onSignOut);
    on<ProfileAppSettingsTapped>(_onAppSettingsTapped);
    on<UpdateNameEvent>(_onUpdateName);
    on<ChangePasswordEvent>(_onChangePassword);
  }

  FutureOr<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final user = SupabaseStart.getCurrentUser();
      if (user == null) {
        emit(ProfileErrorState("User not logged in"));
        return;
      }

      final email = user.email;

      await SupabaseStart.client.auth.signInWithPassword(
        email: email!,
        password: event.oldPassword,
      );

      await SupabaseStart.client.auth.updateUser(
        UserAttributes(password: event.newPassword),
      );

      emit(PasswordChangedState());
    } on AuthException catch (e) {
      emit(ProfileErrorState("Auth Error: ${e.message}"));
    } catch (e) {
      emit(ProfileErrorState("Unexpected error: ${e.toString()}"));
    }
  }

  FutureOr<void> _onSignOut(
    ProfileSignOutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(SigningOutState());
    try {
      await SupabaseStart.signOut();
      emit(SignOutSuccessState());
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  FutureOr<void> _onAppSettingsTapped(
    ProfileAppSettingsTapped event,
    Emitter<ProfileState> emit,
  ) {
    emit(NavigateToAppSettingsState());
  }

  FutureOr<void> _onUpdateName(
    UpdateNameEvent event,
    Emitter<ProfileState> emit,
  ) async {
    // emit(ProfileLoadingState());

    try {
      final user = SupabaseStart.getCurrentUser();

      if (user == null) {
        emit(ProfileErrorState("User not logged in"));
        return;
      }

      await SupabaseStart.client.auth.updateUser(
        UserAttributes(data: {'user_name': event.newName}),
      );

      await SupabaseStart.client.auth.refreshSession();

      emit(ProfileUpdatedState());
    } catch (e) {
      emit(ProfileErrorState("Failed to update name: ${e.toString()}"));
    }
  }
}
