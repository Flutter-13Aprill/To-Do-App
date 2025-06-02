import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_bloc.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_event.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_state.dart';
import 'package:to_do_project/featuers/onbording/data/model/onbording_model.dart';

class CustomOnboardingPageView extends StatelessWidget {
  const CustomOnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final onboardingBloc = context.read<OnboardingBloc>();

        return PageView.builder(
          controller: onboardingBloc.pageController,
          itemCount: state.pages.length,
          onPageChanged: (index) {
            onboardingBloc.add(OnboardingPageChanged(index));
          },
          itemBuilder: (context, index) {
            final OnbordingModel currentPageData = state.pages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  currentPageData.image,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const Gap(30),
                Text(
                  currentPageData.title,
                  style: TextStyles.lato700,
                  textAlign: TextAlign.center,
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    currentPageData.subtitle,
                    style: TextStyles.lato400s16.copyWith(
                      color: AppPalete.gray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
