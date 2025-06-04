import 'package:flutter/material.dart';
import 'package:todoapp/index_home/model/category.dart';

class Edit extends StatelessWidget {
  final String title;
  final String desc;
  final DateTime date;
  final int priority;
  final TimeOfDay time;
  final category categor;
  // final
  const Edit({
    super.key,
    required this.desc,
    required this.date,
    required this.priority,
    required this.time,
    required this.categor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.delete),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.repeat))],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.circle_outlined),
              ListTile(title: Text(title), subtitle: Text(desc)),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ],
          ),

          SizedBox(height: 30),
          Row(
            children: [
              Image.asset("images/timer.png"),
              SizedBox(width: 12),
              Text("Task Time :"),
              Card(child: Row(children: [

              ],)),
            ],
          ),
        ],
      ),
    );
  }
}
