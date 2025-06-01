// widgets/icon_container.dart
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
   final VoidCallback onTap;

  const IconContainer({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
     required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: 
               Border.all(color: StyleColor.primaryPurpulColor, width: 2.0)
              
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
