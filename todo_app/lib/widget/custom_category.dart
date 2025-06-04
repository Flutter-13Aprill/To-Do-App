import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/theme/colors_app.dart';

class CustomCategoryItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CustomCategoryItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor,
                ),
              ),
              SvgPicture.asset(iconPath, height: 20, width: 20),
            ],
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: ColorsApp.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
