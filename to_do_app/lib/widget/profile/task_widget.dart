import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.secondary,
          ),
          child: Row(
            children: [
              Text("Task left", style: AppTextStyles.subText).tr(),
              Text(" 10", style: AppTextStyles.subText),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 37, vertical: 17),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.secondary,
          ),
          child: Row(
            children: [
              Text("Task done", style: AppTextStyles.subText).tr(),
              Text(" 5", style: AppTextStyles.subText),
            ],
          ),
        ),
      ],
    );
  }
}
