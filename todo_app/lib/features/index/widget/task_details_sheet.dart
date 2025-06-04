import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/style/style_size.dart';
import 'package:todo_app/style/style_text.dart';

/// A bottom sheet widget to show the task details
class TaskDetailsSheet extends StatelessWidget {
  const TaskDetailsSheet({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          StyleSize.sizeH16,
          StyleSize.sizeH48,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.sync),
              ),
            ],
          ),
          ListTile(
            leading: Checkbox(value: true, onChanged: (value) {}),
            title: Text(task.title),
            subtitle: Text(task.description!),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text("taskTime".tr()),
            trailing: Chip(
              label: Text(
                task.taskTime.toString(),
                style: StyleText.latoRegular10,
              ),
              backgroundColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_offer_outlined),
            title: Text("taskCategory".tr()),
            trailing: Chip(
              label: Text(task.category!.tr(), style: StyleText.latoRegular10),
              backgroundColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.flag_outlined),
            title: Text("taskPriority".tr()),
            trailing: Chip(
              label: Text(
                task.priority.toString(),
                style: StyleText.latoRegular10,
              ),
              backgroundColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_offer_outlined),
            title: Text("subTask".tr()),
            trailing: Chip(
              label: Text("addSubTask".tr(), style: StyleText.latoRegular10),
              backgroundColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text("deleteTask".tr(), style: StyleText.latoRegular16Error),
          ),
        ],
      ),
    );
  }
}
