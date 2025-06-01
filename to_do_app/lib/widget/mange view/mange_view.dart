import 'package:flutter/material.dart';
import 'package:to_do_app/view/empty_task/empty_task_view.dart';
import 'package:to_do_app/view/task/task_view.dart';

class MangeView extends StatelessWidget {
  const MangeView({
    super.key,
    required this.layoutIndex,
    required this.taskIsEmpty,
  });
  final int layoutIndex;
  final bool taskIsEmpty;
  @override
  Widget build(BuildContext context) {
    switch (layoutIndex) {
      case 0:
        if (taskIsEmpty) {
          return EmptyTaskView();
        } else{
          return TaskView();
          }
      default:
        return Text("default");
    }
  }
}
