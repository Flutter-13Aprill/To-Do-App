import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project6/core/service/local_storage.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final getItData = GetIt.I.get<LocalStorage>();

  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<CheckFirstTimeUserEvent>(checkApp);
  }

  FutureOr<void> checkApp(
    CheckFirstTimeUserEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    final bool isDownloaded =
        await getItData.getData(key: 'isOnboardingVisited') ?? false;
    //if yes, navigate to login page
    if (isDownloaded) {
      emit(FirstTimeUseApp());
    } else {
      //if no, navigate to onboarding
      emit(NotFirstTimeUseApp());
    }
  }
}
