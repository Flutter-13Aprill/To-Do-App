import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class ProfileTaskContainer extends StatelessWidget {
  const ProfileTaskContainer({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(multiplied: 0.4),
      height: context.getHeight(multiplied: 0.07),
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppPalette.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(label, style: TextStyles.lato40018,),
    );
  }
}