import 'package:flutter/material.dart';
import 'package:todo_list/repo/supabase.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/widgets/task_count_card_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String imagePath;
  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            maxRadius: 50,
            child: ClipOval(child: Image.asset(imagePath)),
          ),
        ),
        AppSpacing.h16,
        Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
        AppSpacing.h24,
        AppSpacing.h24,
        FutureBuilder<List<int>>(
          future: Future.wait([
            SupabaseConnect.getCompletedTasksCount(),
            SupabaseConnect.getInCompletedTasksCount(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading tasks count');
            } else {
              final completedCount = snapshot.data?[0] ?? 0;
              final inCompletedCount = snapshot.data?[1] ?? 0;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TaskCountCardWidget(
                    count: inCompletedCount,
                    title: 'task_left',
                  ),
                  AppSpacing.w16,
                  TaskCountCardWidget(
                    count: completedCount,
                    title: 'task_done',
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
