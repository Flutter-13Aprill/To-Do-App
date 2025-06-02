import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPriority extends StatelessWidget {
  final String text;
  final bool isSelected = false;
  const CustomPriority({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.red : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.flag, color: isSelected ? Colors.red : Colors.grey),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
