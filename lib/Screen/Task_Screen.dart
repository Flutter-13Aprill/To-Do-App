import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Models/Task_model.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_event.dart';
import 'package:to_do_app_development/Widget/Edit_Task_Dialog.dart';
import 'package:to_do_app_development/Widget/task_chip.dart';
import 'package:to_do_app_development/Widget/task_display.dart';

class TaskScreen extends StatelessWidget {
  final Task task;
  final int index;
  final onUpdate;
  const TaskScreen({
    super.key,
    required this.task,
    required this.index,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.close, color: Colors.white),
                  Row(
                    children: const [
                      Icon(Icons.repeat_sharp, color: Colors.white),
                      SizedBox(height: 20, width: 40),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Task Title
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54, width: 2),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 70),
                  const Icon(Icons.mode_edit_outlined, color: Colors.white),
                ],
              ),

              const SizedBox(height: 8),

              /// Task Description
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  task.description,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),

              /// Info Cards
              _buildInfoCard(
                child: TaskDisplay(
                  icon: Icons.access_time,
                  label: "Task Time",
                  content: TaskChip(
                    text: () {
                      if (task.dueDate == null) {
                        return "No date";
                      }
                      final now = DateTime.now();

                      final today = DateTime(now.year, now.month, now.day);
                      final tomorrow = today.add(const Duration(days: 1));
                      String dateLabel;
                      if (DateTime(
                            task.dueDate!.year,
                            task.dueDate!.month,
                            task.dueDate!.day,
                          ) ==
                          today) {
                        dateLabel = "Today At";
                      } else if (DateTime(
                            task.dueDate!.year,
                            task.dueDate!.month,
                            task.dueDate!.day,
                          ) ==
                          tomorrow) {
                        dateLabel = "Tomorrow At";
                      } else {
                        dateLabel =
                            "${task.dueDate!.day.toString().padLeft(2, '0')}/"
                            "${task.dueDate!.month.toString().padLeft(2, '0')}/"
                            "${task.dueDate!.year}";
                      }
                      final timeLabel =
                          "${task.dueDate!.hour.toString().padLeft(2, '0')}:"
                          "${task.dueDate!.minute.toString().padLeft(2, '0')}";
                      return "$dateLabel, $timeLabel";
                    }(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildInfoCard(
                child: TaskDisplay(
                  icon: Icons.category,
                  label: "Task Category",
                  content: TaskChip(
                    text: task.category.name,
                    icon: task.category.icon,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildInfoCard(
                child: TaskDisplay(
                  icon: Icons.flag,
                  label: "Task Priority",
                  content: TaskChip(text: task.priority.toString()),
                ),
              ),
              const SizedBox(height: 16),

              _buildInfoCard(
                child: TaskDisplay(
                  icon: Icons.subdirectory_arrow_right,
                  label: "Sub - Task",
                  content: TaskChip(text: "Add Sub - Task", icon: Icons.add),
                ),
              ),

              const SizedBox(height: 20),

              /// Delete Task
              /// Delete Task
              GestureDetector(
                onTap: () async {
                  final confirmed = await showDeleteConfirmationDialog(
                    context,
                    task.title,
                  );
                  if (confirmed == true) {
                    context.read<TaskBloc>().add(DeleteTaskEvent(index));
                    Navigator.pop(context,'delete'); // Go back after deletion
                  }
                },
                child: Row(
                  children: const [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      "Delete Task",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// Edit Task Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    final editedTask = await showDialog<Task>(
                      context: context,
                      builder: (context) => EditTaskDialog(task: task),
                    );

                    if (editedTask != null) {
                      Navigator.pop(
                        context,
                        editedTask,
                      ); // Return to IndexScreen with updated task
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8687E7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Edit Task",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Future<bool?> showDeleteConfirmationDialog(
    BuildContext context,
    String taskTitle,
  ) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            
            backgroundColor: const Color(0xFF1D1D1D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              "Delete Task",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(color: Colors.grey),
                const SizedBox(height: 8),
                const Text(
                  "Are you sure you want to delete this task?",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Task title : $taskTitle",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actionsPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              GestureDetector(
                onTap: () => Navigator.pop(context, false),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xFF8687E7), fontSize: 16),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8687E7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context,true);
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}
