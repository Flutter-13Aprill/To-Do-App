import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project6/layer_data/app_data.dart';
import 'package:project6/models/category_model.dart';
import 'package:project6/models/task/task_model.dart';
import 'package:project6/repo/supabase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool isChecked = false;
  bool isSelect = false;
  int hasValue = 1;
  int hour = 0;
  int mins = 0;
  TimeOfDay? timer = TimeOfDay(hour: 0, minute: 0);

  DateTime? date;
  TextEditingController taskController = TextEditingController();
  // TimeOfDay  = TimeOfDay.now();
  CategoryModel catagory = CategoryModel(
    category: '',
    icon: '',
    color: Colors.black,
  );
  List<Widget> todos = [];
  String priorty = '';
  AppData appDataGetIt = GetIt.I.get<AppData>();

  // TextEditingController taskController = TextEditingController();
  HomeBloc() : super(HomeInitial()) {
    on<ChangePage>(changePage);
    on<AddEvent>(addTaskMethod);
    on<SupaEvent>(supaMethod);
    on<CheckEvent>(checkBox);
    on<SelectPrioEvent>(prioSelect);
  }

  FutureOr<void> changePage(ChangePage event, Emitter<HomeState> emit) {
    emit(SuccessState());
  }

  FutureOr<void> addTaskMethod(AddEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> supaMethod(SupaEvent event, Emitter<HomeState> emit) {
    
    SupabaseConnect.addTask(
      task: TaskModel(
        isComplete: isChecked,
        task: taskController.text,
        catagory: catagory.category,
        priorty: int.parse(priorty),
        date: date!.toString(),
      ),
    );
    emit(SuccessState());
  }

  FutureOr<void> checkBox(CheckEvent event, Emitter<HomeState> emit) {
    isChecked = !isChecked;
    emit(CheckedState());
  }

  FutureOr<void> prioSelect(SelectPrioEvent event, Emitter<HomeState> emit) {

    isSelect = !isSelect;
    emit(SuccessState());

  }
}
