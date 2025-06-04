import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/repo/supabase.dart';

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
on<SubmitCategory>((event, emit) async {
  if (state.name.isEmpty || state.icon == null || state.color == null) return;

  final iconName = IconsMap.entries
      .firstWhere((entry) => entry.value == state.icon,
          orElse: () => const MapEntry('category', Icons.category))
      .key;

  final colorIndex = categoriesColors.indexOf(state.color!);

  await SupabaseConnect.insertCategory(state.name, iconName, colorIndex);

  emit(state.copyWith(submitted: true));
});


  }
}