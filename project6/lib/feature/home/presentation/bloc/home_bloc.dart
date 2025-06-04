import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:project6/core/service/local_storage.dart';
import 'package:project6/core/service/supabase_connect.dart';
import 'package:project6/feature/home/data/model/category/category_model.dart';
import 'package:project6/feature/home/data/model/task_data/task_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  DateTime today = DateTime.now();
  DateTime time = DateTime.now();

  int? selectedPriority;
  IconData? selectedIcon;
  Color? selectedColor;
  final List<TaskDataModel> tasks = [];
  final getItData = GetIt.I.get<LocalStorage>();
  List<CategoryModel> categories = GetIt.I.get<LocalStorage>().categories;
  String get formattedDate => DateFormat('dd/MM/yyyy').format(today);
  String get formattedTime => DateFormat('hh:mm a').format(time);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetDateEvent>(dateSelected);
    on<GetTimeEvent>(timeSelected);
    on<TaskPriorityEvent>(taskPrioritySelected);
    on<ColorSelectedEvent>(colorSelected);
    on<IconSelectedEvent>(iconSelected);
    on<CreateCategoryEvent>(createCategory);
    on<AddTaskEvent>(addTask);
    on<FetchTasksEvent>(fetchTasks);
    // on<LoadCategoriesEvent>(_onLoadCategories);
    add(LoadCategoriesEvent());
  }

  FutureOr<void> dateSelected(GetDateEvent event, Emitter<HomeState> emit) {
    today = event.day;
    emit(DateSelected(date: today));
  }

  FutureOr<void> timeSelected(GetTimeEvent event, Emitter<HomeState> emit) {
    time = event.time;
    emit(TimeSelected(date: time));
  }

  FutureOr<void> taskPrioritySelected(
    TaskPriorityEvent event,
    Emitter<HomeState> emit,
  ) {
    selectedPriority = event.taskPriority;
    emit(TaskPrioritySelected(priority: selectedPriority!));
  }

  FutureOr<void> colorSelected(
    ColorSelectedEvent event,
    Emitter<HomeState> emit,
  ) {
    selectedColor = event.colorSelect;
    emit(ColorCategoryState(color: selectedColor!));
  }

  FutureOr<void> iconSelected(
    IconSelectedEvent event,
    Emitter<HomeState> emit,
  ) {
    selectedIcon = event.iconSelect;
    emit(IconCategoryState(icon: selectedIcon!));
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<HomeState> emit) async {
    try {
      await SupabaseConnect.insertTask(
        task: TaskDataModel(
          task: taskController.text,
          description: descriptionController.text,
          date: formattedDate,
          time: formattedTime,
          priority: selectedPriority!,
        ),
      );

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }

  FutureOr<void> createCategory(
    CreateCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    final newCategory = CategoryModel(
      categoryName: categoryController.text,
      categoryIcon: selectedIcon!,
      categoryColor: selectedColor!,
    );
    categories.add(newCategory);
    await getItData.saveCategory(category: categories);

    emit(CategoryState(newCategory));
  }

  FutureOr<void> fetchTasks(
    FetchTasksEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      await SupabaseConnect.getTaskData();

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
