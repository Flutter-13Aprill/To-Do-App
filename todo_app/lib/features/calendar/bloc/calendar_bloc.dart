import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/layer_data/app_data.dart';
import 'package:todo_app/model/task_model.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  DateTime selectedDate = DateTime.now();
  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarEvent>((event, emit) {});
    on<LoadCalendarDataEvent>(loadMethod);
    on<UpdateSelectedDateEvent>(updateMethod);
  }
  FutureOr<void> loadMethod(
    LoadCalendarDataEvent event,
    Emitter<CalendarState> emit,
  ) async {
    try {
      final data = await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
      emit(SuccessState(data));
    } catch (_) {
      emit(ErrorState());
    }
  }

  FutureOr<void> updateMethod(
    UpdateSelectedDateEvent event,
    Emitter<CalendarState> emit,
  ) async {
    final data = await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
    emit(SuccessState(data));
  }
}
