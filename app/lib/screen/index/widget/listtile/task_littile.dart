import 'package:app/model/task/task.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TaskLittile extends StatelessWidget {
  TaskLittile({
    super.key,
    this.taskCatograyng,
    required this.leading,
    required this.ttitle,
    required this.value,
    required this.onTap
  });
  Function()? onTap;
  Icon leading;
  String ttitle;
  String value;
    IconData ?taskCatograyng;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onTap ,
      leading: leading,
      title: Text(ttitle),
      trailing: Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        width: 115,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 142, 140, 137),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Row(
          children: [
            Icon(taskCatograyng),
             Text(value)
          ],
        ),
      ),
    );
  }
}
