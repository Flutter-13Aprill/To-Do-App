import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<SelectDate>((event, emit) {
      emit(CalendarSuccess(event.date));
    });

    on<ChangeMonth>((event, emit) {
      final currentDate =
          state is CalendarSuccess
              ? (state as CalendarSuccess).selectedDate
              : DateTime.now();

      final newDate =
          event.next
              ? DateTime(currentDate.year, currentDate.month + 1, 1)
              : DateTime(currentDate.year, currentDate.month - 1, 1);

      emit(CalendarSuccess(newDate));
    });
  }
}
