import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task_edit_title_container.dart';
import 'package:to_do_list/widgets/task_edit_value_container.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.cancel_outlined),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.restart_alt_rounded)),
        ],
      ),

      body: Column(
        children: [
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (value) {
                value == true;
              },
            ),
            title: Text("Task Name"),
            subtitle: Text("Task Description"),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ),

          Row(
            children: [
              TaskEditTitleContainer(titleColors: Colors.white),
              TaskEditValueContainer(),
            ],
          ),
          Row(
            children: [
              TaskEditTitleContainer(titleColors: Colors.white),
              TaskEditValueContainer(),
            ],
          ),
          Row(
            children: [
              TaskEditTitleContainer(titleColors: Colors.white),
              TaskEditValueContainer(),
            ],
          ),
          Spacer(),
          InkWell(
            child: Container(
              color: Colors.deepPurple,
              child: Text("Edit Task", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
