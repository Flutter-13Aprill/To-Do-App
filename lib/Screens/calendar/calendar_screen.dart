import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/calendar/calendar_row.dart';
import 'package:getit/CustomWidgets/calendar/calendar_todo_tile.dart';
import 'package:getit/Screens/calendar/bloc/calendar_bloc.dart';
import 'package:getit/Styles/colors.dart';

/// Make sure you import your ToDoModel class:

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  // Helper to strip time portion so we compare only the date (year, month, day).
  DateTime _stripTime(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final bloc = context.read<CalendarBloc>();
          final selectedDate = bloc.selectedDate;
          final allTodos = bloc.todosList; // List<ToDoModel>

          // Filter all todos to get those due on 'selectedDate'
          final todaysTodos = allTodos.where((todo) {
            final due = DateTime.parse(todo.dueDate);
            return _stripTime(due) == _stripTime(selectedDate);
          }).toList();

          final today = todaysTodos.where((todo) {
            return !todo.isDone;
          }).toList();
          // Of those, which are completed?
          final completedToday = todaysTodos
              .where((todo) => todo.isDone)
              .toList();

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Calendar'),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  // ─── Calendar Row ───────────────────────────────
                  // Always show the single‐row calendar immediately below the AppBar.
                  const CalendarRow(),
                  const SizedBox(height: 16),

                  // ─── Tab Bar ────────────────────────────────────
                  // Place the TabBar under the calendar.
                  Container(
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TabBar(
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "Today",
                            style: TextStyle(color: mainText),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Completed",
                            style: TextStyle(color: mainText),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Optional: a thin divider under the TabBar for separation
                  Container(height: 1, color: Colors.grey.shade300),

                  // ─── Tab Bar View ───────────────────────────────
                  Expanded(
                    child: TabBarView(
                      children: [
                        // ─── “Today” Tab ────────────────────
                        todaysTodos.isEmpty
                            ? const Center(
                                child: Text(
                                  'No todos for this date',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                itemCount: today.length,
                                itemBuilder: (context, index) {
                                  final todo = today[index];
                                  return BlocProvider.value(
                                    value: bloc,
                                    child: CalendarTodoTile(todo: todo),
                                  );
                                },
                              ),

                        // ─── “Completed” Tab ─────────────────
                        completedToday.isEmpty
                            ? const Center(
                                child: Text(
                                  'No completed todos for this date',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                itemCount: completedToday.length,
                                itemBuilder: (context, index) {
                                  final todo = completedToday[index];
                                  return BlocProvider.value(
                                    value: context.read<CalendarBloc>(),
                                    child: CalendarTodoTile(todo: todo),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
