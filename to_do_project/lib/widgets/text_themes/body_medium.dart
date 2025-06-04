import 'package:flutter/material.dart';
import 'package:to_do_project/style/color_theme.dart';

class BodyMedium extends StatelessWidget {
  const BodyMedium({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: AppColors.white,
    ));
  }
}