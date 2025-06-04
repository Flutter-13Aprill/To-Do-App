import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.darkGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            color: AppColors.primary,
            child: Text("Today", style: AppTextStyles.subText).tr(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 2, color: AppColors.grey),
            ),
            child: Text("Completed", style: AppTextStyles.subText).tr(),
          ),
        ],
      ),
    );
  }
}
