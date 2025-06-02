import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_state.dart';

part 'add_task_event.dart';


class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(const AddTaskState()) {
    on<TitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<DatePicked>((event, emit) {
      emit(state.copyWith(date: event.date));
    });

    on<TimePicked>((event, emit) {
      emit(state.copyWith(time: event.time));
    });

    on<PriorityPicked>((event, emit) {
      emit(state.copyWith(priority: event.priority));
    });

   on<CategoryPicked>((event, emit) {
  emit(state.copyWith(
    category: event.category,
    categoryColor: event.categoryColor,
    categoryImage: event.categoryImage, // ✅ Add this
  ));
});


 on<SubmitTask>((event, emit) {
  print('STATE:');
  print('Title: ${state.title}');
  print('Description: ${state.description}');
  print('Date: ${state.date}');
  print('Time: ${state.time}');
  print('Priority: ${state.priority}');
  print('Category: ${state.category}');
});
on<TempCategorySelected>((event, emit) {
  emit(state.copyWith(selectedCategoryName: event.categoryName));
});

  }
}



