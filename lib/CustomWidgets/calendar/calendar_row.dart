import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/calendar/bloc/calendar_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarRow extends StatelessWidget {
  const CalendarRow({super.key});
  DateTime _stripTime(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        final bloc = context.read<CalendarBloc>();
        final allTodos = bloc.todosList; // List<ToDoModel>
        return TableCalendar(
          eventLoader: (day) {
            final normalizedDay = _stripTime(day);

            // Filter bloc.todosList by matching year/month/day of dueDate.
            // Adjust DateTime.parse if your dueDate strings have a different format.
            final todaysTodos = allTodos.where((todo) {
              final due = DateTime.parse(todo.dueDate);
              final dueDay = _stripTime(due);
              return dueDay == normalizedDay;
            }).toList();

            return todaysTodos; // returns a List<ToDoModel>
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (events.isNotEmpty) {
                // Draw a single 6×6 circle in primaryColor, positioned at the bottom center:
                return Positioned(
                  bottom: 8,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          selectedDayPredicate: (day) {
            return isSameDay(day, bloc.selectedDate);
          },
          onDaySelected: (selectedDay, focusedDay) {
            // When the user taps a day, fire DaySelectedEvent:
            bloc.selectedDate = selectedDay;
            focusedDay = bloc.selectedDate;

            bloc.add(DaySelectedEvent());
          },
          calendarFormat: CalendarFormat.week,
          availableCalendarFormats: const {CalendarFormat.week: 'Week'},
          focusedDay: bloc.selectedDate,
          firstDay: DateTime.now().subtract(const Duration(days: 30)),
          lastDay: DateTime.now().add(const Duration(days: 30)),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            decoration: BoxDecoration(color: containerColor),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: BoxDecoration(color: containerColor),
            weekdayStyle: TextStyle(color: mainText),
            weekendStyle: TextStyle(color: errorColor),
          ),
          calendarStyle: CalendarStyle(
            cellPadding: EdgeInsets.all(8),

            rowDecoration: BoxDecoration(color: containerColor),

            defaultDecoration: BoxDecoration(
              color: dayColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            weekendDecoration: BoxDecoration(
              color: dayColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            outsideDecoration: BoxDecoration(
              color: dayColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            // Customize selected day appearance
            selectedDecoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            // Customize today's date appearance
            todayDecoration: BoxDecoration(
              color: dayColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        );
      },
    );
  }
}
