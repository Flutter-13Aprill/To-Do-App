import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/widget/button/custom_button.dart';
import 'package:project6/core/widget/button/custom_text_button.dart';
import 'package:project6/feature/auth/presentation/page/start_page.dart';
import 'package:project6/feature/onboarding/data/model/onboarding_model.dart';
import 'package:project6/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:project6/feature/onboarding/presentation/widget/custom_smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),

      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            context.customPushReplacement(StartPage());
          }
        },
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          final isLastPage = bloc.currentPage == onboardingData.length - 1;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: PageView.builder(
                controller: bloc.controller,
                onPageChanged: (index) {
                  bloc.add(UpdateCurrentPageEvent(pageIndex: index));
                },
                itemCount: onboardingData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomTextButton(
                            text: AppText.skip,
                            onPressed: () {
                              context.customPushReplacement(StartPage());
                            },
                          ),
                        ),
                        Image.asset(onboardingData[index].image),
                        SizedBox(height: 51),
                        CustomSmoothPageIndicator(controller: bloc.controller),
                        SizedBox(height: 50),
                        Text(
                          onboardingData[index].title,
                          style: TextStyles.lato70032,
                        ),
                        SizedBox(height: 42),
                        Text(
                          textAlign: TextAlign.center,
                          onboardingData[index].subTitle,
                          style: TextStyles.lato40016,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              onPressed: () {
                                bloc.add(PreviousPageEvent());
                              },
                              text: AppText.back,
                            ),
                            CustomButton(
                              onPressed: () {
                                isLastPage
                                    ? bloc.add(CompleteOnboardingEvent())
                                    : bloc.add(NextPageEvent());
                              },
                              height: isLastPage ? 48 : null,
                              width: isLastPage ? 150 : null,

                              child: Text(
                                isLastPage ? AppText.start : AppText.next,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 74),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}