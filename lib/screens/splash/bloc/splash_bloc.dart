import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/screens/home/index/index.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
  }

  // FutureOr<void> splashMethod(SplashEvent event, Emitter<SplashState> emit) {
  //   Future.delayed(Duration(seconds: 5), () {
  //     Navigator.pushReplacement(
  //       MaterialPageRoute(builder: (context) => IndexScreen()),
  //     );
  //   });
}
