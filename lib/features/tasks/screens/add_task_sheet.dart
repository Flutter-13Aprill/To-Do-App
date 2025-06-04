import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/tasks/models/task_model.dart';
import 'package:to_do_app/features/tasks/bloc/bloc/tasks_bloc.dart';


class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedPriority = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFF1D1D1D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Do math homework',
                hintStyle: const TextStyle(color: Colors.white30),
                filled: true,
                fillColor: const Color(0xFF121212),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Do chapter 2 to 5 for next week',
                hintStyle: const TextStyle(color: Colors.white30),
                filled: true,
                fillColor: const Color(0xFF121212),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now,
                      lastDate: DateTime(now.year + 2),
                      builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Color(0xFF8687E7),
                            onPrimary: Colors.white,
                            surface: Color(0xFF1D1D1D),
                            onSurface: Colors.white,
                          ),
                          dialogBackgroundColor: const Color(0xFF121212),
                        ),
                        child: child!,
                      ),
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),
                if (selectedDate != null)
                  Text(
                    DateFormat.yMMMd().format(selectedDate!),
                    style: const TextStyle(color: Colors.white),
                  ),
                IconButton(
                  icon: const Icon(Icons.access_time, color: Colors.white),
                  onPressed: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Color(0xFF8687E7),
                            onPrimary: Colors.white,
                            surface: Color(0xFF1D1D1D),
                            onSurface: Colors.white,
                          ),
                          dialogBackgroundColor: const Color(0xFF121212),
                        ),
                        child: child!,
                      ),
                    );
                    if (picked != null) {
                      setState(() => selectedTime = picked);
                    }
                  },
                ),
                if (selectedTime != null)
                  Text(
                    selectedTime!.format(context),
                    style: const TextStyle(color: Colors.white),
                  ),
                IconButton(
                  icon: const Icon(Icons.flag, color: Colors.white),
                  onPressed: () {
                    int temp = selectedPriority;
                    showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (context, setStateDialog) => AlertDialog(
                          backgroundColor: const Color(0xFF1D1D1D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: const Text(
                            'Task Priority',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: List.generate(10, (index) {
                              final val = index + 1;
                              final selected = val == temp;
                              return GestureDetector(
                                onTap: () => setStateDialog(() => temp = val),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? const Color(0xFF8687E7)
                                        : const Color(0xFF2D2D2D),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$val',
                                    style: TextStyle(
                                      color: selected
                                          ? Colors.white
                                          : Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white54),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() => selectedPriority = temp);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8687E7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF8687E7)),
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        selectedDate == null ||
                        selectedTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all required fields"),
                        ),
                      );
                      return;
                    }

                    final newTask = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selectedDate!,
                      time: selectedTime!,
                      priority: selectedPriority,
                    );

                    context.read<TasksBloc>().add(AddTaskEvent(newTask));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
