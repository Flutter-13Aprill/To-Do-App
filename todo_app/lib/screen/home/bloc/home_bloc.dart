import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/task/task_model.dart';
import 'package:todo_app/repository/supabase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<TaskModel> tasks = [];

  final SupabaseConnect getitTask = GetIt.I.get<SupabaseConnect>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  int? selectedPriority;
  HomeBloc() : super(HomeInitial()) {
    on<AddTaskEvent>(addMethod);
    on<SelectPriorityEvent>(selectPriorityMethod);
    on<SelectDateTimeEvent>(selectTime);
  }

  FutureOr<void> addMethod(AddTaskEvent event, Emitter<HomeState> emit) async {
    try {
      final userId = getitTask.getCurrentUserId();
      final task = TaskModel(
        userId: userId,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate ?? DateTime.now(),
        priority: selectedPriority ?? 1,
      );

      await getitTask.addTask(task);
      tasks = await getitTask.getTasks(userId);
      emit(TaskAddedSuccessState(tasks));
    } catch (e) {
      emit(TaskErrorState(message: e));
    }
  }

  FutureOr<void> selectPriorityMethod(
    SelectPriorityEvent event,
    Emitter<HomeState> emit,
  ) {
    selectedPriority = event.priority;
    emit(PrioritySelectedState(event.priority));
  }

  FutureOr<void> selectTime(
    SelectDateTimeEvent event,
    Emitter<HomeState> emit,
  ) {
    selectedDate = event.dateTime;
    emit(DateTimeSelectedState(event.dateTime));
  }
}




    // on<AddTaskEvent>(addMethod);
    // on<LodTasksEvent>(loadMethod);
    // on<SelectTaskDateEvent>(selectDateMethod);
    // on<SelectTaskTimeEvent>(selectTimeMethod);

//   FutureOr<void> addMethod(AddTaskEvent event, Emitter<HomeState> emit) async {
//     final title = titleController.text.trim();
//     // final description = descriptionController.text.trim();
//     if (title.isEmpty) {
//       emit(TaskAddedErrorState(message: 'Please enter a task title'));
//       return;
//     }
//     if (selectedDate == null) {
//       emit(TaskAddedErrorState(message: 'Please select date and time'));
//       return;
//     }
//     try {
//       final userId = getitTask.getCurrentUserId();
//       final task = TaskModel(
//         title: title,
//         description: event.description,
//         dateTime: selectedDate!,
//         userId: userId,
//         priority: 1,
//       );
//       await getitTask.addTask(task);
//       titleController.clear();
//       descriptionController.clear();
//       selectedDate = null;
//       emit(TaskAddedSuccessState());
//     } catch (e) {
//       emit(TaskAddedErrorState(message: e.toString()));
//     }
//   }

//   FutureOr<void> loadMethod(
//     LodTasksEvent event,
//     Emitter<HomeState> emit,
//   ) async {
//     try {
//       final userId = getitTask.getCurrentUserId();
//       final List<TaskModel> tasks = await getitTask.getTasks(userId);
//       emit(TasksLoadedState(tasks));
//     } catch (e) {
//       emit(TaskAddedErrorState(message: e.toString()));
//     }
//   }

//   FutureOr<void> selectTimeMethod(
//     SelectTaskTimeEvent event,
//     Emitter<HomeState> emit,
//   ) {
//     if (selectedDate != null && selectedDate is DateTime) {
//       // final dateOnly = selectedDate as DateTime;

//       selectedDate = DateTime(
//         selectedDate!.year,
//         selectedDate!.month,
//         selectedDate!.day,
//         event.time.hour,
//         event.time.minute,
//       );
//       emit(UpdateSelectedDateState(selectedDate!));
//     } else {
//       emit(TaskAddedErrorState(message: 'Please select a date first'));
//     }
//   }

//   FutureOr<void> selectDateMethod(
//     SelectTaskDateEvent event,
//     Emitter<HomeState> emit,
//   ) {
//     selectedDate = DateTime(event.date.year, event.date.month, event.date.day);
//     emit(UpdateSelectedDateState(selectedDate!));
//   }