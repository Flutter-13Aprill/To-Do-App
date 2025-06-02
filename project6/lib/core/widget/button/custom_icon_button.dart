import 'package:flutter/material.dart';
import 'package:project6/core/theme/app_palette.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.color,
    this.size,
  });
  final void Function()? onPressed;
  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? AppPalette.whiteColor, size: size ?? 24),
    );
  }
}
