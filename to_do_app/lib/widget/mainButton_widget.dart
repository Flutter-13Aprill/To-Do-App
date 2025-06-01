import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';

class MainButtonWidget extends StatelessWidget {
   const MainButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.width,
    this.isBack = false,
  });
  final Function onTap;
  final String text;
  final double width;
  // final double width;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 56,
        decoration: isBack? null: BoxDecoration(
          color:AppColors.deepPurple,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color:isBack? AppColors.textPrimary: AppColors.surface,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
