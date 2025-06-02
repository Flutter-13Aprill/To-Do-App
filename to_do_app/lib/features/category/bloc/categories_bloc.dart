import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<CategoryNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<CategoryColorChanged>((event, emit) {
      emit(state.copyWith(color: event.color));
    });
    on<CategoryIconChanged>((event, emit) {
      emit(state.copyWith(icon: event.icon));
    });
    on<SubmitCategory>((event, emit) {
      emit(state.copyWith(submitted: true));
    });
  }
}