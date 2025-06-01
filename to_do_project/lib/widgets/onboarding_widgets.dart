import 'package:flutter/material.dart';
import 'package:to_do_project/models/app_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Image.asset(data.imagePath, height: 300),
          const SizedBox(height: 40),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class OnboardingDots extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingDots({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 8,
          width: currentIndex == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Theme.of(context).primaryColor
                : Colors.white24,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class OnboardingButtons extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingButtons({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLast = currentIndex == totalPages - 1;

    return Column(
      children: [
        if (currentIndex != 0)
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'BACK',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        SizedBox(
          width: isLast ? 150 : 90,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // إزالة البادينق الداخلي
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: onNext,
            child: Center(
              child: Text(
                isLast ? 'GET STARTED' : 'NEXT',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
