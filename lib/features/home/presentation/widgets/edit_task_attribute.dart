import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/data/model/category_model.dart';

class EditTaskAttribute extends StatelessWidget {
  const EditTaskAttribute({super.key, required this.label, required this.iconPath, required this.rectWidth, required this.rectHeight, this.category, this.attributeLabel});

  final String label;
  final String? attributeLabel;
  final CategoryModel? category;
  final String iconPath;
  final double rectWidth;
  final double rectHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),

        EmptySpace.sizeW8,

        Text(
          tr(label),
          style: TextStyles.lato40018.copyWith(color: Colors.white),
        ),

        Spacer(),

        Container(
          alignment: Alignment.center,
          width: rectWidth,
          height: rectHeight,
          decoration: BoxDecoration(
            color: AppPalette.primaryBackgroundColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: category != null ? 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SvgPicture.asset(category!.categoryIconPath),

              EmptySpace.sizeW16,

              Text(category!.categoryName, style: TextStyles.lato40014.copyWith(color: Colors.white))
            ],
          )
          :
           Text(attributeLabel ?? "",style: TextStyles.lato40014.copyWith(color: Colors.white),),
        ),
      ],
    );
  }
}
