import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController = TextEditingController();
  DateTime taskDate = DateTime.now();
  String taskPriority = '';
  String taskCategory = '';

  TasksBloc() : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PressedFloatingButton>(pressedFloatingButton);

    on<AddTaskEvent>(addTask);
  }

  FutureOr<void> pressedFloatingButton(PressedFloatingButton event, Emitter<TasksState> emit) {

    emit(SuccessPressingFloatingButtonState());
  }


  FutureOr<void> addTask(AddTaskEvent event, Emitter<TasksState> emit) {

    
  }
}
