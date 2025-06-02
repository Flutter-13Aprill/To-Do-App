import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/task/task_model.dart';
import 'package:todo_app/repository/supabase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SupabaseConnect getitTask = GetIt.I.get<SupabaseConnect>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  HomeBloc() : super(HomeInitial()) {
    on<AddTaskEvent>(addMethod);
    on<LodTasksEvent>(loadMethod);
  }

  FutureOr<void> addMethod(AddTaskEvent event, Emitter<HomeState> emit) async {
    final title = titleController.text.trim();
    // final description = descriptionController.text.trim();
    if (title.isEmpty) {
      emit(TaskAddedErrorState(message: 'Please enter a task title'));
      return;
    }

    try {
      final userId = getitTask.getCurrentUserId();
      final task = TaskModel(
        title: event.title,
        description: event.description,
        dateTime: DateTime.now(),
        userId: userId,
        priority: 1,
      );
      await getitTask.addTask(task.toMap() as TaskModel);
      titleController.clear();
      descriptionController.clear();

      emit(TaskAddedSuccessState());
    } catch (e) {
      emit(TaskAddedErrorState(message: e.toString()));
    }
  }

  FutureOr<void> loadMethod(
    LodTasksEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final userId = getitTask.getCurrentUserId();
      final List<TaskModel> tasks = await getitTask.getTasks(userId);
      emit(TasksLoadedState(tasks));
    } catch (e) {
      emit(TaskAddedErrorState(message: e));
    }
  }
}
