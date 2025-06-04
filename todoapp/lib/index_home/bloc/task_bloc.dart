import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/index_home/model/category.dart';
import 'package:todoapp/index_home/model/task.dart';
import 'package:todoapp/index_home/screens/newcategory.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskLoadedState> {
  TaskBloc() : super(TaskLoadedState(tasks: [])) {
    on<AddTaskevent>(_addTask);
    on<TaskPrioritychose>(_changePriority);
    on<taskcategorychose>(_changeCategory);
    on<ToggleTaskCompletion>(_toggleCompletion);
    on<UpdateSearchQuery>(_searchquery);
    on<NewCategory>(_newcategory);
    on<SelectedcategoryColor>(_seletccategoryolor);
  }

  FutureOr<void> _addTask(AddTaskevent event, Emitter<TaskLoadedState> emit) {
  
    if (state is TaskLoadedState) {
      final updatedTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(state.copyWith(tasks: updatedTasks));
    }
  }

  FutureOr<void> _changePriority(
    TaskPrioritychose event,
    Emitter<TaskLoadedState> emit,
  ) {
   
    if (state is TaskLoadedState) {
      emit(state.copyWith(selectedPriority: event.Priorityindex));
    }
  }

  FutureOr<void> _changeCategory(
    taskcategorychose event,
    Emitter<TaskLoadedState> emit,
  ) {
   
    if (state is TaskLoadedState) {
     
      emit(state.copyWith(selectedCategory: event.categoryindex));
    }
  }

  FutureOr<void> _toggleCompletion(
    ToggleTaskCompletion event,
    Emitter<TaskLoadedState> emit,
  ) {
  
    if (state is TaskLoadedState) {
      final updatedTasks = List<Task>.from(state.tasks);
      final task = updatedTasks[event.index];
      updatedTasks[event.index] = task.copyWith(isCompleted: !task.isCompleted);

      emit(state.copyWith(tasks: updatedTasks));
    }
  }

  FutureOr<void> _searchquery(
    UpdateSearchQuery event,
    Emitter<TaskLoadedState> emit,
  ) {

    if (state is TaskLoadedState) {
      final filter = state.tasks.where((task) {
        return task.title.toLowerCase().contains(
          event.searchtext.toLowerCase(),
        );
      }).toList();
      emit(state.copyWith(tasks: filter, searchquery: event.searchtext));
    }
  }

  FutureOr<void> _newcategory(NewCategory event, Emitter<TaskLoadedState> emit) {
   
if (state is TaskLoadedState){

  emit(state.copyWith(selectedCategory: event.newcategory));
}
  }

  FutureOr<void> _seletccategoryolor(SelectedcategoryColor event, Emitter<TaskLoadedState> emit) {
   
if (state is TaskLoadedState){
  // emit(currentState.copyWith(se))
}

  }
}
