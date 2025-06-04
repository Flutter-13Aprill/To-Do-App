import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/features/home/data/model/category_model.dart';

class TaskCategoryChip extends StatelessWidget {
  const TaskCategoryChip({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(multiplied: 0.3),
      height: context.getHeight(multiplied: 0.04),
      decoration: BoxDecoration(
        color: category.categoryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Spacer(),
          SvgPicture.asset(category.categoryIconPath,width: 14, height: 14,),

          Text(category.categoryName, style: TextStyles.lato40014.copyWith(color: Colors.white),),
          Spacer()
        ],
      ),
    );
  }
}