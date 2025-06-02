import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/index/bloc/index_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class TaskCard extends StatelessWidget {
  final int id;
  final String task;
  final String day;
  final String month;
  final String year;
  final int priority;
  final bool isDone;

  const TaskCard({
    super.key,
    required this.task,
    required this.day,
    required this.month,
    required this.year,
    required this.priority,
    required this.id,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();

    return Container(
      height: 72,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: isDone,
                onChanged: (value) {
                  if (isDone == true) {
                    bloc.add(UpdateTask(isDone: false, id: id));
                  }
                  if (isDone == false) {
                    bloc.add(UpdateTask(isDone: true, id: id));
                  }
                },
                shape: CircleBorder(),
                side: BorderSide(color: AppColors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(task, style: AppTextStyles.subText),
                  Text(
                    "$day / $month / $year",
                    style: AppTextStyles.settingSubText,
                  ),
                ],
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 20, right: 20),
            height: 29,
            width: 42,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary),
              borderRadius: BorderRadius.circular(4),
              color: Color(0xff272727),
            ),
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flag_outlined, color: AppColors.white, size: 14),
                Text("$priority", style: AppTextStyles.smallText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
