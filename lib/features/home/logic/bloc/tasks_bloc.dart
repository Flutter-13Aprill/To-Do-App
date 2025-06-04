import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/core/connection_supabase.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';
import 'package:uptodo/features/home/data/repo/task_repo.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController = TextEditingController();
  String taskCategory = "";
  String taskPriority = "";
  DateTime selectedDate = DateTime.now();
  
  TasksBloc() : super(TasksInitial()) {
    
    on<TasksEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ToAddTaskEvent>(toAddTask);

    on<SelectedDateEvent>(selectDate);

    on<AddTaskEvent>(addTask);
  }

  FutureOr<void> selectDate(SelectedDateEvent event, Emitter<TasksState> emit) {
    emit(SuccessSelectingState());
  }

  FutureOr<void> toAddTask(ToAddTaskEvent event, Emitter<TasksState> emit) {
    emit(ToShowAddTaskDialog());
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<TasksState> emit) async {

    final task = event.task;
    String? userName = ConnectionSupabase.user?.email;
    final indexOfHash = userName?.indexOf('@');
    userName = userName?.substring(0,indexOfHash);
    task.userName = userName;

    try{
      await TaskRepo.addTask(task);
    }catch(error){
      log(error.toString());
    }
  }
}
