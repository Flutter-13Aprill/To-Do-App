import 'package:flutter/material.dart';

class TaskDisplay extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget content;

  const TaskDisplay({
    Key? key,
    required this.icon,
    required this.label,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Left Icon
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.05),
          ),
          child: Icon(icon, size: 18, color: Colors.white),
        ),

        const SizedBox(width: 12),

        /// Label and Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 6),
              content,
            ],
          ),
        ),
      ],
    );
  }
}
