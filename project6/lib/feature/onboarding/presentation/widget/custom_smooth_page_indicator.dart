import 'package:flutter/material.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/onboarding/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // PageController
      count: onboardingData.length,
      effect: SlideEffect(
        dotColor: AppPalette.grayColor,
        activeDotColor: AppPalette.whiteColor,
        dotHeight: 4,
        dotWidth: 26.28,
      ), // your preferred effect
      onDotClicked: (index) {},
    );
  }
}
