import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project6/models/task/task_model.dart';
import 'package:project6/repo/supabase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int hasValue = 1;
  TimeOfDay? timer;
  DateTime? date;
  TextEditingController taskController = TextEditingController();
  String catagory = '';
  List<Widget> test = [];
  // TextEditingController taskController = TextEditingController();
  HomeBloc() : super(HomeInitial()) {
    on<ChangePage>(changePage);
    on<AddEvent>(addTaskMethod);
    on<SupaEvent>(supaMethod);
  }

  FutureOr<void> changePage(ChangePage event, Emitter<HomeState> emit) {
    emit(SuccessState());
  }

  FutureOr<void> addTaskMethod(AddEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> supaMethod(SupaEvent event, Emitter<HomeState> emit) {
    SupabaseConnect.addTask(
      task: TaskModel(
        isComplete: false,
        task: taskController.text,
        catagory: catagory,
        priorty: 1,
        date: date!.toString(),

      ),
        
    );
    emit(SuccessState());
  }
}
