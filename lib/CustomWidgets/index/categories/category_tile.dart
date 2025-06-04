import 'package:flutter/material.dart';
import 'package:getit/Styles/colors.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.name,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    // Adjust this size if you want the tile to be larger/smaller
    return InkWell(
      enableFeedback: true,
      borderRadius: BorderRadius.circular(4),
      focusColor: Colors.greenAccent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
