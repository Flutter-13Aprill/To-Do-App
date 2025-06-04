import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/data/data_layer/category_data_layer.dart';
import 'package:uptodo/features/home/presentation/widgets/category_component.dart';

// ignore: must_be_immutable
class CategoriesDialog extends StatelessWidget {
  
  CategoriesDialog({super.key, required this.getCategory});

  void Function(String value) getCategory;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: context.getWidth(),
        height: context.getHeight(multiplied: 0.6),
        decoration: BoxDecoration(
          color: AppPalette.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              EmptySpace.sizeH16,

              Text(
                tr('home_screen.choose_category'),
                style: TextStyles.lato40018.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              Divider(thickness: 2, color: AppPalette.dividerColor),

              EmptySpace.sizeH16,

              Wrap(
                runSpacing: 16,
                spacing: 16,
                children: List.generate(10, (index) {
                  return CategoryComponent(category: categories[index], getCategory: (value) { getCategory(value);  },);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}