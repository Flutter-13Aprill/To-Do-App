import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'task_event.dart';
import 'task_state.dart';
import '../../../../models/app_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initial()) {
    on<TaskTitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<TaskDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<TaskDateChanged>((event, emit) {
      emit(state.copyWith(dueDate: event.date));
    });

    on<TaskTimeChanged>((event, emit) {
      emit(state.copyWith(time: event.time));
    });

    on<TaskPriorityChanged>((event, emit) {
      emit(state.copyWith(priority: event.priority));
    });

    on<TaskSubmitted>((event, emit) {
      if (state.title.isEmpty ||
          state.description.isEmpty ||
          state.dueDate == null ||
          state.time.isEmpty ||
          state.priority.isEmpty) {
        emit(state.copyWith(isFailure: true));
        return;
      }

      final newTask = TaskModel(
        id: const Uuid().v4(),
        title: state.title,
        description: state.description,
        dueDate: state.dueDate!,
        time: state.time,
        priority: state.priority,
      );

      final updatedTasks = List<TaskModel>.from(state.tasks)..add(newTask);

      emit(TaskState.initial().copyWith(tasks: updatedTasks, isSuccess: true));
    });
  }
}
