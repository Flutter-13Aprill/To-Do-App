import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/style/my_style.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';

class EmptyTaskView extends StatelessWidget {
  const EmptyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StyleApp.sizeH48,
        Container(
          width: context.getWight(),
          height: context.getHight(pre: 0.3),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.border
                : null,
            image: DecorationImage(
              image: AssetImage("lib/assets/images/home/checklist.png"),
            ),
          ),
        ),
        Text(
          "What do you want to do today?",
          textAlign: TextAlign.center,
          style: ThemeData().textTheme.bodyMedium,
        ),
        Text(
          " Tap + to add your tasks",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
