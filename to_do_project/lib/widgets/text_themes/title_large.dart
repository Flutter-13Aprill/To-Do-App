import 'package:flutter/material.dart';
import 'package:to_do_project/style/color_theme.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
    text,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: AppColors.white,
    ));
  }
}