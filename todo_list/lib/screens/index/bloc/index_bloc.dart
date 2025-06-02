import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/models/task/task_model.dart';
import 'package:todo_list/style/app_colors.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descController = TextEditingController();

  TextEditingController priorityController = TextEditingController();
  int? selectedPriority;
  int? selectedCategory;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<TaskModel> tasks = [];

  final List<String> categories = [
    "Grocery",
    "Work",
    "Sport",
    "Design",
    "University",
    "Social",
    "Music",
    "Health",
    "Movie",
    "Home",
    "Create New",
  ];

  final Map<String, IconData> categoryIcons = {
    "Grocery": Icons.local_grocery_store,
    "Work": Icons.work,
    "Sport": Icons.sports_soccer,
    "Design": Icons.design_services,
    "University": Icons.school,
    "Social": Icons.people,
    "Music": Icons.music_note,
    "Health": Icons.health_and_safety,
    "Movie": Icons.movie,
    "Home": Icons.home,
    "Create New": Icons.add,
  };

  final List<Color> iconColors = [
    AppColors.blue,
    AppColors.lightBlue,
    AppColors.teal,
    AppColors.green,
    AppColors.violet,
    AppColors.yellowGreen,
    AppColors.pink,
    AppColors.orange,
    AppColors.violet,
    AppColors.yellowGreen,
    AppColors.pink,
    AppColors.orange,
    AppColors.violet,
  ];

  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {});
    on<SaveDataEvent>(saveMethod);
    on<PrioritySelectedEvent>((event, emit) {
      selectedPriority = event.priority;
      emit(PriorityUpdatedState());
    });

    on<CategorySelectedEvent>((event, emit) {
      selectedCategory = event.category;
      emit(CategoryUpdatedState());
    });
    on<FetchTasksEvent>(fetchTasks);
    on<SearchTasksEvent>(searchTasks);
    on<ToggleTaskCompletedEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final user = Supabase.instance.client.auth.currentUser;
        if (user == null) {
          emit(ErrorState());
          return;
        }

        final taskIndex = tasks.indexWhere((task) => task.id == event.taskId);
        if (taskIndex == -1) {
          emit(ErrorState());
          return;
        }

        final currentTask = tasks[taskIndex];
        final newCompletedStatus = !currentTask.isCompleted;

        final updates = {'is_completed': newCompletedStatus};

        final response = await Supabase.instance.client
            .from('tasks')
            .update(updates)
            .eq('id', event.taskId);

        final updatedTask = currentTask.copyWith(
          isCompleted: newCompletedStatus,
        );
        final updatedTasks = List<TaskModel>.from(tasks);
        updatedTasks[taskIndex] = updatedTask;

        tasks = updatedTasks;

        emit(TasksLoadedState(tasks: updatedTasks));
      } catch (e, stack) {
        print("Error toggling task completed: $e");
        print(stack);
        emit(ErrorState());
      }
    });

    on<DateSelectedEvent>((event, emit) {
      selectedDate = event.date;
      print("Bloc selected date updated: $selectedDate");
      emit(DateUpdatedState(date: event.date));
    });

    on<TimeSelectedEvent>((event, emit) {
      selectedTime = event.time;
      print("Selected time updated in bloc: $selectedTime");
    });

    add(FetchTasksEvent());
  }
  Future<void> fetchTasks(
    FetchTasksEvent event,
    Emitter<IndexState> emit,
  ) async {
    emit(LoadingState());

    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        print("User is not logged in.");
        emit(ErrorState());
        return;
      }

      final data = await Supabase.instance.client
          .from('tasks')
          .select()
          .eq('user_id', user.id)
          .order('priority', ascending: true);

      tasks = (data as List<dynamic>).map((e) => TaskModel.fromMap(e)).toList();

      emit(TasksLoadedState(tasks: tasks));
    } catch (e, stackTrace) {
      print("Error occurred while loading tasks");
      print(stackTrace);
      emit(ErrorState());
    }
  }

  Future<void> saveMethod(SaveDataEvent event, Emitter<IndexState> emit) async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        emit(ErrorState());
        return;
      }

      final title = taskController.text;
      final description = descController.text;
      final priority = selectedPriority ?? 0;

      print("Bloc selected date: $selectedDate");
      print("Bloc selected time: $selectedTime");
      DateTime? combinedDateTime;

      if (selectedDate != null && selectedTime != null) {
        combinedDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTime!.hour,
          selectedTime!.minute,
        );
      } else {
        combinedDateTime = DateTime.now();
      }

      await Supabase.instance.client.from('tasks').insert({
        'title': title,
        'description': description,
        'category_id': selectedCategory ?? 0,
        'priority': priority,
        'datetime': combinedDateTime.toIso8601String(),
        'user_id': user.id,
      });

      taskController.clear();
      descController.clear();
      priorityController.clear();
      selectedPriority = null;

      emit(TaskSavedState());
    } catch (e, stack) {
      print("Error occurred while saving data");
      print(stack);
      emit(ErrorState());
    }
  }

  void searchTasks(SearchTasksEvent event, Emitter<IndexState> emit) {
    final query = event.query.toLowerCase();
    print('Searching for: ${event.query}');

    final filteredTasks =
        tasks.where((task) {
          return task.title.toLowerCase().contains(query);
        }).toList();

    emit(TasksLoadedState(tasks: filteredTasks));
  }

  String formatDateTimeHumanFriendly(BuildContext context, DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final difference = target.difference(today).inDays;

    String dayLabel;
    if (difference == 0) {
      dayLabel = 'Today';
    } else if (difference == 1) {
      dayLabel = 'Tomorrow';
    } else if (difference < 0) {
      dayLabel = '${difference.abs()} day(s) ago';
    } else {
      dayLabel = 'In $difference day(s)';
    }

    final timeLabel = TimeOfDay.fromDateTime(dateTime).format(context);

    return '$dayLabel at $timeLabel';
  }
}
