import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const CustomMenuIcon({
    super.key,
    this.color = Colors.white,
    this.width = 24,
    this.height = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Full width line
          Container(height: 3, width: width, color: color),
          // Medium width line
          Container(
            height: 3,
            width: width * 0.66, // 2/3 width
            color: color,
          ),
          // Small width line
          Container(height: 3, width: width * 0.33, color: color),
        ],
      ),
    );
  }
}
