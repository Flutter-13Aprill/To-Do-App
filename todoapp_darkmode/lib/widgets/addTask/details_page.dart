import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/models/task_model.dart';
import 'package:todoapp_darkmode/screens/home_screens/bloc/home_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

Widget buildTaskDetailsPage(BuildContext context, TaskModel task) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Close and Share Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => context.read<HomeBloc>().add(LoadTasksEvent()),
            ),
            IconButton(
              icon: const Icon(Icons.repeat, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 10),

        // ✅ Title and Description
        Row(
          children: [
            const Icon(Icons.radio_button_unchecked, color: Colors.white),
            const SizedBox(width: 8),
            Text(task.title, style: AppFonts.fontSizeFive.copyWith(color: Colors.white)),
            const Spacer(),
IconButton(
  icon: Image.asset("lib/assets/images/homeImages/edit.png", ),
  onPressed: () {
    // your logic here
  },
)

          ],
        ),
        const SizedBox(height: 4),
        Text(task.description ?? "", style: const TextStyle(color: Colors.white70)),

        const SizedBox(height: 30),

        // Info Rows with Images
        _detailsRow("lib/assets/images/homeImages/timer.png", "Task Time :", "Today At ${task.time.format(context)}"),
        const SizedBox(height: 12),
        _detailsRow("lib/assets/images/homeImages/tag.png", "Task Category :", task.category),
        const SizedBox(height: 12),
        _detailsRow("lib/assets/images/homeImages/flag.png", "Task Priority :", "Priority ${task.priority}"),
        const SizedBox(height: 12),
        _detailsRow("lib/assets/images/homeImages/hierarchy.png", "Sub - Task", "Add Sub - Task"),

        const SizedBox(height: 24),

        // Delete Task
        GestureDetector(
          onTap: () => context.read<HomeBloc>().add(DeleteTaskEvent(task.id!)),
          child: Row(
            children: [
              Image.asset("lib/assets/images/homeImages/trash.png", width: 24, height: 24),
              const SizedBox(width: 8),
              const Text("Delete Task", style: TextStyle(color: Colors.red, fontSize: 16)),
            ],
          ),
        ),

        const Spacer(),

        // Edit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {}, // Add navigation to edit screen here
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lilac,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text("Edit Task"),
          ),
        ),
      ],
    ),
  );
}

Widget _detailsRow(String imagePath, String label, String value) {
  return Row(
    children: [
      Image.asset(imagePath, width: 24, height: 24),
      const SizedBox(width: 12),
      Text(label, style: const TextStyle(color: Colors.white70)),
      const Spacer(),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF3C3C3C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(value, style: const TextStyle(color: Colors.white)),
      ),
    ],
  );
}
