import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/core/theme/app_palete.dart';

import '../../bloc/onbording_bloc.dart';
import '../../bloc/onbording_state.dart';

class OnboardingPageIndicators extends StatelessWidget {
  const OnboardingPageIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Row(
          children: List.generate(
            state.pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: state.currentPageIndex == index ? 24 : 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: state.currentPageIndex == index
                    ? AppPalete.buttton
                    : AppPalete.gray,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }
}
