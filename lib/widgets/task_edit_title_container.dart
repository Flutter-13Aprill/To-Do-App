import 'package:flutter/material.dart';

class TaskEditTitleContainer extends StatelessWidget {
  const TaskEditTitleContainer({super.key, required this.titleColors});
  final Color titleColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.timer, color: titleColors),
          Text("Task Edit Title", style: TextStyle(color: titleColors)),
        ],
      ),
    );
  }
}
