import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:getit/Repo/supabase_model_connect.dart';
import 'package:getit/Repo/todo_data.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final supabase = GetIt.I.get<SupabaseConnect>();
  final todosList = GetIt.I.get<SupabaseConnect>().todosList;
  final categories = GetIt.I.get<TodoData>().categories;
  DateTime selectedDate = DateTime.now();

  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DaySelectedEvent>((event, emit) {
      emit(CalendarDateChanged());
    });
  }
}
