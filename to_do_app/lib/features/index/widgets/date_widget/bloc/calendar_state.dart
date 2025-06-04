part of 'calendar_bloc.dart';

class CalendarState {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  CalendarState({required this.selectedDate, required this.selectedTime});

  DateTime get fullDateTime => DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

  CalendarState copyWith({DateTime? selectedDate, TimeOfDay? selectedTime}) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}