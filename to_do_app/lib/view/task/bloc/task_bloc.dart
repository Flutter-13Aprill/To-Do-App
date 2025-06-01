import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/utils/getit/setup.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
    final getIt = GetIt.I<AppData>();
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {});
    on<ChangeTaskState>(changeTaskState);
  }


  FutureOr<void> changeTaskState(ChangeTaskState event, Emitter<TaskState> emit) {
    getIt.tasks[event.taskIndex].isDone=!getIt.tasks[event.taskIndex].isDone;
    emit(ChangeTaskStateSuccessfully());
  }
}
