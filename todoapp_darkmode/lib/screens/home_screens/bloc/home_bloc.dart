import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_darkmode/core/setup_locator.dart';
import 'package:todoapp_darkmode/data/repo/task_repsitory.dart';
import 'package:todoapp_darkmode/models/task_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskRepository _repository = locator<TaskRepository>();

  HomeBloc() : super(HomeInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  on<DetailsTaskEvent>((event, emit) {
  emit(TaskDetailsState(event.task));
});


    
  }

  Future<void> _onLoadTasks(LoadTasksEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final tasks = await _repository.loadTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(HomeError("Failed to load tasks: $e"));
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<HomeState> emit) async {
    try {
      await _repository.addTask(event.task);
      final tasks = await _repository.loadTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(HomeError("Failed to add task: $e"));
    }
  }

  Future<void> _onDeleteTask(DeleteTaskEvent event, Emitter<HomeState> emit) async {
    try {
      await _repository.deleteTask(event.id);
      final tasks = await _repository.loadTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(HomeError("Failed to delete task: $e"));
      
    }
  


  }
 
}


