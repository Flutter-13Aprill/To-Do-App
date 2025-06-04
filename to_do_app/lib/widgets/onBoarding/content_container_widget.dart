import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';

class ContentContainerWidget extends StatelessWidget {
  const ContentContainerWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textHint),
        ),
      ],
    );
  }
}
