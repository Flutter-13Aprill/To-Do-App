import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class TaskPriorityChip extends StatelessWidget {
  const TaskPriorityChip({super.key, required this.priorityNumber});

  final String priorityNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppPalette.priorityBorderColor,
          width: 1
        )
      ),
      child: Row(
        spacing: 5,
        children: [
          SvgPicture.asset('assets/visuals/home/svgs/flag.svg'),
          Text(priorityNumber, style: TextStyles.lato40014.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}