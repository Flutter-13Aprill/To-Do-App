import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/tasks/bloc/bloc/tasks_bloc.dart';
import 'package:to_do_app/features/tasks/models/task_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showCompleted = false;

  List<DateTime> getCurrentWeekDates() {
    final today = DateTime.now();
    final start = today.subtract(Duration(days: today.weekday % 7));
    return List.generate(7, (index) => start.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    final selectedDate = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          // شريط الأسبوع
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: weekDates.map((date) {
                final isSelected =
                    DateFormat('yyyy-MM-dd').format(date) ==
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                return Column(
                  children: [
                    Text(
                      DateFormat('EEE').format(date).toUpperCase(),
                      style: const TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF8687E7)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),

          // أزرار Today / Completed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => showCompleted = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showCompleted
                          ? const Color(0xFF1D1D1D)
                          : const Color(0xFF8687E7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Today'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => showCompleted = true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showCompleted
                          ? const Color(0xFF8687E7)
                          : const Color(0xFF1D1D1D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Completed'),
                  ),
                ),
              ],
            ),
          ),

          // قائمة المهام
          Expanded(
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state is TasksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TasksLoaded) {
                  final filtered = state.tasks.where((task) {
                    final today = DateTime.now();
                    final taskDate = task.date;
                    final sameDay =
                        taskDate.year == today.year &&
                        taskDate.month == today.month &&
                        taskDate.day == today.day;
                    return sameDay;
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(
                      child: Text(
                        'No tasks.',
                        style: TextStyle(color: Colors.white54),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final task = filtered[index];
                      return Card(
                        color: const Color(0xFF1D1D1D),
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.radio_button_off,
                            color: Colors.white,
                          ),
                          title: Text(
                            task.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${DateFormat.yMMMMd().format(task.date)} at ${task.time.format(context)}',
                            style: const TextStyle(color: Colors.white54),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'P${task.priority}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No tasks.',
                      style: TextStyle(color: Colors.white54),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
