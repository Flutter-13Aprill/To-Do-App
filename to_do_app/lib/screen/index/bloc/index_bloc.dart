import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/layer_data/app_data.dart';
import 'package:to_do_app/model/task/task_model.dart';
import 'package:to_do_app/repo/supabase.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final dataLayer = GetIt.I.get<AppDataLayer>();

  TextEditingController taskController = TextEditingController();
  TextEditingController desciptionController = TextEditingController();
  String day = "";
  String month = "";
  String year = "";
  int priority = 0;

  IndexBloc() : super(IndexInitial()) {
    on<SendTask>(sendTaskMethod);
    on<ChangeDate>(ChangeDateMethod);
    on<AddPriority>(addPriorityMethod);
    on<LoadData>(loadDataMethod);
    on<UpdateTask>(updateTaskMethod);
  }

  FutureOr<void> loadDataMethod(LoadData event, Emitter<IndexState> emit) {
    dataLayer.loadDataFromSupabase();
    emit(SuccessLoad());
  }

  FutureOr<void> ChangeDateMethod(ChangeDate event, Emitter<IndexState> emit) {
    day = event.day.toString();
    month = event.month.toString();
    year = event.year.toString();
  }

  FutureOr<void> addPriorityMethod(
    AddPriority event,
    Emitter<IndexState> emit,
  ) {
    priority = event.priority;
  }

  FutureOr<void> sendTaskMethod(
    SendTask event,
    Emitter<IndexState> emit,
  ) async {
    try {
      await SupabaseConnect.addNewTask(
        task: TaskModel(
          id: 1,
          createdAt: "",
          task: taskController.text,
          desciption: desciptionController.text,
          day: day,
          month: month,
          year: year,
          priority: priority,
          isDone: false,
        ),
      );
      emit(SuccessLoad());
    } catch (_) {}
  }

  FutureOr<void> updateTaskMethod(
    UpdateTask event,
    Emitter<IndexState> emit,
  ) async {
    try {
      await SupabaseConnect.taskUpdate(isDone: event.isDone, id: event.id);
      emit(SuccessLoad());
    } catch (_) {}
  }
}
