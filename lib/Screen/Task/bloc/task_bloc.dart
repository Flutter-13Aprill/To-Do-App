import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Models/Task_model.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_event.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final List<Task> _tasks = [];

  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_onAddTask);
    on<SearchTaskEvent>(_onSearch);
    on<EditTaskEvent>(_onEditTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  // Add task logic
  void _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    _tasks.add(event.task);
    emit(TaskLoadSuccess(allTasks: List.from(_tasks), filteredTasks: List.from(_tasks)));
  }

  // Search logic
  void _onSearch(SearchTaskEvent event, Emitter<TaskState> emit) {
    final query = event.query.toLowerCase();
    final filtered = _tasks.where((task) {
      return task.title.toLowerCase().contains(query) ||
          task.description.toLowerCase().contains(query);
    }).toList();

    emit(TaskLoadSuccess(allTasks: List.from(_tasks), filteredTasks: filtered));
  }

  // Edit task logic
  void _onEditTask(EditTaskEvent event, Emitter<TaskState> emit) {
    if (event.index >= 0 && event.index < _tasks.length) {
      _tasks[event.index] = event.updatedTask;
      emit(TaskLoadSuccess(allTasks: List.from(_tasks), filteredTasks: List.from(_tasks)));
    }
  }

  // Delete task logic
  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    if (event.index >= 0 && event.index < _tasks.length) {
      _tasks.removeAt(event.index);
      emit(TaskLoadSuccess(allTasks: List.from(_tasks), filteredTasks: List.from(_tasks)));
    }
  }
}
