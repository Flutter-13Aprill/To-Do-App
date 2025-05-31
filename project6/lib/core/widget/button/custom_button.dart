import 'package:flutter/material.dart';
import 'package:project6/core/theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.width,
    this.height,
  });
  final void Function() onPressed;
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppPalette.purpleColor,
        foregroundColor: AppPalette.whiteColor,
        fixedSize: Size(width ?? 90, height ?? 48),
      ),
      child: child,
    );
  }
}
