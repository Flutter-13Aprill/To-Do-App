
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/models/task/task_model.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc(this.taskService) : super(TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<FinishTasksEvent>(_updateTasks);
    on<LoadTasksByDateEvent>(_onLoadTasksByDate);
    on<SearchTasksEvent>((event, emit) {
  if (state is TaskLoaded) {
    final currentState = state as TaskLoaded;
    final filtered = currentState.tasks
        .where((task) => task.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(TaskLoaded(currentState.tasks, filtered: filtered));
  }
});
   
    


  }




  
  Future<void> _onLoadTasks(LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await taskService.getTasks();
for (var task in tasks) {
   if(isToday(task.dueDate)){
           task.proccedDate='Today at ${formatTime(task.dueDate)}';
   }else{
     task.proccedDate=null;
   }
}
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("eroor:$e"));
    }
  }
   Future<void> _updateTasks(FinishTasksEvent event, Emitter<TaskState> emit) async {
        final taskid= event.taskId;
    try{
    await SupabaseConnect.taskFinish(id: taskid);
    await Future.delayed(Duration.zero);
      add(LoadTasksEvent());
    }catch(e){
      print('there is error in update is_finsh :$e');
      emit(TaskError("eroor:$e"));
    }
    
 
  }
  Future<void> _onLoadTasksByDate(LoadTasksByDateEvent event, Emitter<TaskState> emit) async {
  emit(TaskLoading());
  try {
    final tasks = await taskService.getTasksByDate(event.selectedDate);
    for (var task in tasks) {
      if (isToday(task.dueDate)) {
        task.proccedDate = 'Today at ${formatTime(task.dueDate)}';
      } else {
        task.proccedDate = null;
      }
    }
    emit(TaskLoaded(tasks, selectedDate: event.selectedDate));
  } catch (e) {
    emit(TaskError("error: $e"));
  }
}



}
bool isToday(DateTime date) {
  final now = DateTime.now();
  return now.year == date.year &&
      now.month == date.month &&
      now.day == date.day;
}

String formatTime(DateTime date) {
  final hour = date.hour.toString().padLeft(2, '0');
  final minute = date.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}
