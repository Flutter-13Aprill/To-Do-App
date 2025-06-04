import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/models/user/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/core/models/task/task_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUsername>(_onUpdateUsername);
    on<UpdatePassword>(_onUpdatePassword);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<ProfileState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');

      if (userId == null) {
        emit(ProfileError(message: 'NO USER FOUND'));
        return;
      }

      
      final UserModel user = await SupabaseConnect.getUserById(userId);

      
      final List<TaskModel> tasks = await SupabaseConnect.getUserTasks(userId);

      final int done = tasks.where((t) => t.isFinish).length;
      final int left = tasks.length - done;

      emit(ProfileLoaded(user: user, taskStats: TaskStats(done, left)));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _onUpdateUsername(UpdateUsername event, Emitter<ProfileState> emit) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      await SupabaseConnect.updateUsername(currentState.user.id, event.newUsername);
      add(LoadUserProfile());
    }
  }

  Future<void> _onUpdatePassword(UpdatePassword event, Emitter<ProfileState> emit) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      await SupabaseConnect.updatePassword(currentState.user.id, event.newPassword);
      emit(PasswordUpdated());
    }
  }
}
