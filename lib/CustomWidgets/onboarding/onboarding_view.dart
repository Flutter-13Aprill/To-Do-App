import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        var bloc = context.read<OnboardingBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 300, height: 300),
            const SizedBox(height: 20),

            SmoothPageIndicator(
              controller: bloc.pageController,
              count: 3,
              effect: SlideEffect(
                radius: 0,
                dotWidth: 24,
                dotHeight: 4,
                dotColor: borderColor,
                activeDotColor: mainText,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: mainText,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
