
class CalendarState {
  final DateTime selectedDate;
  final bool showCompleted;

  CalendarState({required this.selectedDate, required this.showCompleted});

  CalendarState copyWith({DateTime? selectedDate, bool? showCompleted}) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      showCompleted: showCompleted ?? this.showCompleted,
    );
  }
}