import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/utils/getit/setup.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  int layoutIndex = 0;
    final getIt = GetIt.I<AppData>();
  // late List<TaskModel> tasks =getIt.tasks;
  late List<CategoryModel> tags =getIt.categoryList;
  late List<int> priorities =getIt.priorities;
  LayoutBloc() : super(LayoutInitial()) {
    on<LayoutEvent>((event, emit) {});
    on<AddNewTask>(addNewTask);
    on<ChangePage>(changePage);
    on<ShowBottomSheet>(showBottomSheet);
    on<ShowCalender>(showCalender);
    on<ShowTag>(showTag);
    on<ShowFlag>(showFlag);
  }

  FutureOr<void> addNewTask(AddNewTask event, Emitter<LayoutState> emit) {
    // tasks.add(event.task);
    getIt.addTask(event.task);
    emit(AddTaskSuccessfully());
  }

  FutureOr<void> changePage(ChangePage event, Emitter<LayoutState> emit) {
    layoutIndex = event.layoutIndex;
    emit(ChangePageSuccessfully());
  }

  FutureOr<void> showBottomSheet(
    ShowBottomSheet event,
    Emitter<LayoutState> emit,
  ) {
    emit(ShowBottomSheetSuccessfully());
  }

  FutureOr<void> showCalender(ShowCalender event, Emitter<LayoutState> emit) {
    emit(ShowCalenderSuccessfully());
  }

  FutureOr<void> showTag(ShowTag event, Emitter<LayoutState> emit) {
    emit(ShowTagSuccessfully());
  }

  FutureOr<void> showFlag(ShowFlag event, Emitter<LayoutState> emit) {
    emit(ShowFlagSuccessfully());
  }
}
