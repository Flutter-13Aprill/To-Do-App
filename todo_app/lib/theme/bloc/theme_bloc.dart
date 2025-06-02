import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/theme/them_app.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDark = false;

  ThemeBloc() : super(ThemeInitial(AppThem.lightTheme)) {
    on<ThemeEvent>((event, emit) {
      isDark = !isDark;
      final newThem = isDark ? ThemeData.dark() : AppThem.lightTheme;
      emit(ThemeState(newThem));
    });
  }
}
