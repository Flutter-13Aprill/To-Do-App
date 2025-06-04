import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/features/home/data/model/category_model.dart';

// ignore: must_be_immutable
class CategoryComponent extends StatelessWidget {
  
  CategoryComponent({super.key, required this.category, required this.getCategory});

  final CategoryModel category;
  void Function(String value) getCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        getCategory(category.categoryName);
        context.pop();
      },
      child: SizedBox(
        width: context.getWidth(multiplied: 0.2),
        height: context.getHeight(multiplied: 0.1),
        child: Column(
          spacing: 8,
          children: [
      
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: category.categoryColor,
              ),
      
              child: SvgPicture.asset(category.categoryIconPath, fit: BoxFit.scaleDown,),
            ),
      
            Text(category.categoryName, style: TextStyles.lato40014.copyWith(color: Colors.white, fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
