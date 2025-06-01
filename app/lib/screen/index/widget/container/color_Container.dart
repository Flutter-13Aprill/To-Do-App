// widgets/color_container.dart (كما في ردي السابق)
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorContainer({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: StyleColor.primaryWhitelColor, width: 3.0)
              : null,
        ),
      ),
    );
  }
}
