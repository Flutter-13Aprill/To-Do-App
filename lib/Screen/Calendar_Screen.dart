import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_event.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_state.dart';
import 'package:to_do_app_development/Screen/calendar/cubit/calendar_cubit.dart';
import 'package:to_do_app_development/Screen/calendar/cubit/calendar_state.dart';
import 'package:to_do_app_development/Widget/Week_View.dart';
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'calendar'.tr(),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, calendarState) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  child: WeekView(
                    selectedDate: calendarState.selectedDate,
                    onDateSelected: (date) => context.read<CalendarCubit>().updateSelectedDate(date),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      _buildToggleButton(
                        'today'.tr(),
                        !calendarState.showCompleted,
                        () => context.read<CalendarCubit>().toggleCompleted(false),
                      ),
                      const SizedBox(width: 12),
                      _buildToggleButton(
                        'completed'.tr(),
                        calendarState.showCompleted,
                        () => context.read<CalendarCubit>().toggleCompleted(true),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoadSuccess) {
                        final tasks = state.allTasks.where((task) {
                          final due = task.dueDate;
                          final matchDate = due != null &&
                              due.year == calendarState.selectedDate.year &&
                              due.month == calendarState.selectedDate.month &&
                              due.day == calendarState.selectedDate.day;
        
                          return matchDate &&
                              (calendarState.showCompleted ? task.isCompleted : !task.isCompleted);
                        }).toList();
        
                        if (tasks.isEmpty) {
                          return Center(
                            child: Text(
                              'no_tasks_for_date'.tr(),
                              style: const TextStyle(color: Colors.white70),
                            ),
                          );
                        }
        
                        return ListView.builder(
                          padding: const EdgeInsets.only(bottom: 80),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            final taskIndex = state.allTasks.indexOf(task);
                            return _buildTaskTile(context, task, taskIndex);
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF8687E7) : const Color(0xFF272727),
            borderRadius: BorderRadius.circular(8),
            border: isSelected ? null : Border.all(color: Colors.grey[700]!),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(BuildContext context, dynamic task, int taskIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF363636),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.read<TaskBloc>().add(
                    EditTaskEvent(index: taskIndex, updatedTask: task.copyWith(isCompleted: !task.isCompleted)),
                  );
            },
            child: Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white54, width: 2),
                color: task.isCompleted ? const Color(0xFF8687E7) : Colors.transparent,
              ),
              child: task.isCompleted ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white70, size: 15),
                    const SizedBox(width: 4),
                    Text(
                      task.dueTime != null
                          ? 'today_at1'.tr(args: [task.dueTime!.format(context)])
                          : 'no_time'.tr(),
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: task.category.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Icon(task.category.icon, color: task.category.color, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            task.category.name,
                            style: TextStyle(
                              color: task.category.color,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1D1D),
                        border: Border.all(color: const Color(0xFF8687E7), width: 1.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.flag_outlined, color: Colors.white, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            "${task.priority.index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
