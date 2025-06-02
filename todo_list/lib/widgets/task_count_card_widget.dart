import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class TaskCountCardWidget extends StatelessWidget {
  final int count;
  final String title;
  const TaskCountCardWidget({
    super.key,
    required this.count,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: context.getHeight(factor: 0.07),
      width: context.getWidth(factor: 0.42),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.darkGray,
      ),
      child: Text(
        "$count ${title.tr()}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
