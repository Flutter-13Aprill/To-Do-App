import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ImageChanged>((event, emit) {
      emit(state.copyWith(imagePath: event.imagePath));
    });

    on<ProfileSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));

      // Later: save to Supabase here

      await Future.delayed(const Duration(seconds: 1)); // simulate saving

      emit(
        state.copyWith(isSubmitting: false, isSuccess: true, isFailure: false),
      );
    });
  }
}
