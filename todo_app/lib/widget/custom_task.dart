import 'package:flutter/material.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_priority.dart';

class CustomTask extends StatelessWidget {
  final String titleTask;
  final String subTitleTask;
  final bool isSelected;
  final String textPrio;

  final void Function(bool?)? onChanged;

  const CustomTask({
    super.key,
    required this.titleTask,
    required this.subTitleTask,
    required this.isSelected,
    required this.textPrio,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorsApp.cardColors,
          borderRadius: BorderRadius.circular(16),
        ),

        child: ListTile(
          leading: Checkbox(value: isSelected, onChanged: onChanged),
          title: Text(
            titleTask,
            style: TextStyle(
              color: ColorsApp.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subTitleTask,
            style: TextStyle(color: ColorsApp.secondText),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(onTap: () {}, child: CustomPriority(text: textPrio)),
            ],
          ),
        ),
      ),
    );
  }
}
