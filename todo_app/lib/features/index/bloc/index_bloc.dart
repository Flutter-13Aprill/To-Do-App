import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/layer_data/app_data.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/repo/supabase.dart';

part 'index_event.dart';
part 'index_state.dart';

/// Bloc responsible for managing the main task index screen state.
///
/// Events handled:
/// - On [LoadinDataEvent], it fetches task data from Supabase via [AppDataLayer]
///   and emits [SuccessState] with the loaded task list or [ErrorState] on failure.
/// - On [SaveDataEvent], it adds a new task to Supabase using current form data
///   and emits [LoadingState] during the process or [ErrorState] if saving fails.
class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  int priority = 1;
  String category = 'Home';
  DateTime taskTime = DateTime.now();
  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {});
    on<LoadinDataEvent>(loadMethod);
    on<SaveDataEvent>(saveMethod);
  }

  FutureOr<void> loadMethod(
    LoadinDataEvent event,
    Emitter<IndexState> emit,
  ) async {
    try {
      final data = await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
      emit(SuccessState(data));
    } catch (_) {
      emit(ErrorState());
    }
  }

  FutureOr<void> saveMethod(
    SaveDataEvent event,
    Emitter<IndexState> emit,
  ) async {
    try {
      await SupabaseConnect.addNewTask(
        taskData: TaskModel(
          title: taskController.text,
          description: descriptionController.text,
          priority: priority,
          category: category,
          taskTime: taskTime,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      emit(LoadingState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
