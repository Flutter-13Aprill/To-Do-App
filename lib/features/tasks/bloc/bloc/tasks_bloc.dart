import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repositories/task_repository.dart';
import '../../models/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository taskRepository;

  TasksBloc({required this.taskRepository}) : super(TasksInitial()) {
    on<AddTaskEvent>(_onAddTask);
    on<FetchTasksEvent>(_onFetchTasks);
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) async {
    try {
      await taskRepository.addTask(event.task);

      final currentState = state;
      if (currentState is TasksLoaded) {
        final updated = List<TaskModel>.from(currentState.tasks)
          ..add(event.task);
        emit(TasksLoaded(updated));
      } else {
        emit(TasksLoaded([event.task]));
      }
    } catch (e) {
      print(' Failed to add task: $e');
    }
  }

  Future<void> _onFetchTasks(
    FetchTasksEvent event,
    Emitter<TasksState> emit,
  ) async {
    emit(TasksLoading());

    try {
      final tasks = await taskRepository.getAllTasks();
      emit(TasksLoaded(tasks));
    } catch (e) {
      print('Failed to fetch tasks: $e');
      emit(TasksLoaded([]));
    }
  }
}
