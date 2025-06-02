import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
      int currentIndex = 0;
      PageController pageController = PageController(
        initialPage: 0
      );
       PageController textPageController = PageController(
        initialPage: 0
      );


  PagesBloc() : super(PagesInitial()) {
    on<ChangePageEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(ChangePageEvent event, Emitter<PagesState> emit) {

    currentIndex = event.value;
    emit(SuccessState());

  }
}
