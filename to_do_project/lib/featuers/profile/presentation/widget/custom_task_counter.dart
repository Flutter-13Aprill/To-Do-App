import 'package:flutter/material.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';

class CustomTaskCounter extends StatelessWidget {
  final String task;
  const CustomTaskCounter({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 154,
      color: AppPalete.bottomNavColor,
      child: Center(child: Text(task, style: TextStyles.lato400s16)),
    );
  }
}
