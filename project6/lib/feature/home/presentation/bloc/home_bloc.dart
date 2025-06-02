import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<AddTaskEvent>(addTask);
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<HomeState> emit) {
    try {
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
