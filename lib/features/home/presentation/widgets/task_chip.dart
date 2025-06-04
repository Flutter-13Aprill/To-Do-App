import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/features/home/data/model/category_model.dart';
import 'package:uptodo/features/home/presentation/widgets/task_category_chip.dart';
import 'package:uptodo/features/home/presentation/widgets/task_priority_chip.dart';

class TaskChip extends StatelessWidget {
  const TaskChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getHeight(multiplied: 0.09),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppPalette.primaryBackgroundColor
      ),
      child: Row(
        spacing: 12,
        children: [
          Checkbox(
            value: true,
            shape: CircleBorder(),
            fillColor: WidgetStateProperty.all(AppPalette.checkBoxColor),
            onChanged:(value) => true,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text('Do Math Homework', style: TextStyles.lato40018,),
              Text('Today At 16:45', style: TextStyles.lato40014.copyWith(color: AppPalette.grayTextColor),)
            ],
          ),

          Column(
            children: [
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),

              Row(
                spacing: 8,
                children: [
                  TaskCategoryChip(category: CategoryModel(categoryName: 'University', categoryIconPath: 'assets/visuals/category/Vector.svg', categoryColor: Color(0xff809CFF), categoryClickedColor: Colors.white)),
                  TaskPriorityChip(priorityNumber: '2')
                ],
              ),

              Spacer()
            ],
          )
        ],
      ),
    );
  }
}