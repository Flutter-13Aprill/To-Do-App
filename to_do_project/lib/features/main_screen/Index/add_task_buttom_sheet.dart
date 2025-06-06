import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_project/features/main_screen/Index/choose_category_screen.dart';
import 'package:to_do_project/features/main_screen/Index/dialog_utils.dart';
import '../Index/bloc/task_bloc.dart';
import '../Index/bloc/task_event.dart';
import '../Index/bloc/task_state.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<TaskBloc>(),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1D1D1D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Title Field
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    context.read<TaskBloc>().add(TaskTitleChanged(value));
                  },
                ),

                // Description Field
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    context.read<TaskBloc>().add(TaskDescriptionChanged(value));
                  },
                ),

                const SizedBox(height: 20),

                // Action Row
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.timer_outlined,
                        color: Colors.white70,
                      ),
                      onPressed: () => showCustomDateDialog(context),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () async {
                        final selectedCategory = await showDialog(
                          context: context,
                          builder: (_) => const ChooseCategoryScreen(),
                        );

                        if (selectedCategory != null) {
                          context.read<TaskBloc>().add(
                            TaskCategoryChanged(
                              name: selectedCategory.name,
                              icon: selectedCategory.icon,
                              color: selectedCategory.color,
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.label_outline,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () async {
                        await showPriorityDialog(context);
                      },
                      icon: const Icon(Icons.flag, color: Colors.white70),
                    ),

                    const Spacer(),

                    // Send Icon
                    IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFF8875FF)),
                      onPressed: () {
                        context.read<TaskBloc>().add(const TaskSubmitted());
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
