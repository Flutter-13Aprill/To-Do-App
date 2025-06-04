import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  BottomSheetContainer({super.key});
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Column(
        children: [
          Text("Add Task"),
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: taskController,
                  decoration: InputDecoration(hint: Text("Add your task here")),
                ),

                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: "Description"),
                ),
              ],
            ),
          ),

          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.timer)),
              IconButton(onPressed: () {}, icon: Icon(Icons.flag)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
