import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_spacing.dart';

class ContentOfOnboardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const ContentOfOnboardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });
  // Onboarding screen widget showing an image, title, and description in a vertical layout.

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSpacing.h72,
        Image.asset(imagePath, height: 300),
        AppSpacing.h72,
        AppSpacing.h72,

        Text(
          title.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.h32,

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            description.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
