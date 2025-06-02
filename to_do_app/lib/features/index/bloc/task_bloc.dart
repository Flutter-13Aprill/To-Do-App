
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/models/task/task_model.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc(this.taskService) : super(TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
  }

  Future<void> _onLoadTasks(
      LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await taskService.getCategories();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("eroor"));
    }
  }
}
