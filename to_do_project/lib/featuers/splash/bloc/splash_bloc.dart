import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/featuers/splash/bloc/splash_event.dart';
import 'package:to_do_project/featuers/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitializeSplash>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));

      emit(SplashLoaded());
    });
  }
}
