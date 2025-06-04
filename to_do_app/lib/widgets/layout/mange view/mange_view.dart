import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/home_widget/empty_task_view.dart';
import 'package:to_do_app/widgets/home_widget/task/task_view.dart';

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
          // return Text("0 e");
        } else {
          return TaskView();
          // return Text("0 ");
        }
      case 1:
        return Text("1"); 
         case 2:
        return Text("2");

      default:
        return Text("default");
    }
    // return Text("default");
  }
}
