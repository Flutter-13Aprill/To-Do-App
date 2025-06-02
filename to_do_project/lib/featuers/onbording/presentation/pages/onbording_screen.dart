import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/function/navigator.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/core/widget/custom_text_button.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_bloc.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_event.dart';
import 'package:to_do_project/featuers/onbording/bloc/onbording_state.dart';
import 'package:to_do_project/featuers/onbording/presentation/widget/custom_page_view.dart';
import 'package:to_do_project/featuers/onbording/presentation/widget/onbording_indecator.dart';
import 'package:to_do_project/featuers/start/presentation/start_screen.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnboardingBloc(),

        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            final onboardingBloc = context.read<OnboardingBloc>();

            return Column(
              children: [
                AppBar(
                  leadingWidth: 100,
                  leading: CustomTextButton(
                    press: () {
                      onboardingBloc.add(const OnboardingSkipRequested());

                      customReplacmentNaviagte(context, const StartScreen());
                    },
                    child: Text(
                      "SKIP",
                      style: TextStyles.lato400s16.copyWith(
                        color: AppPalete.gray,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Expanded(child: const CustomOnboardingPageView()),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // زر BACK
                      if (state.currentPageIndex > 0)
                        CustomTextButton(
                          press: () {
                            onboardingBloc.add(
                              const OnboardingPreviousPageRequested(),
                            );
                          },
                          child: Text(
                            "BACK",
                            style: TextStyles.lato400s16.copyWith(
                              color: AppPalete.gray,
                            ),
                          ),
                        )
                      else
                        const SizedBox(width: 70),

                      const OnboardingPageIndicators(),

                      CustomElvatedButton(
                        press: () {
                          if (state.currentPageIndex < state.pages.length - 1) {
                            onboardingBloc.add(
                              const OnboardingNextPageRequested(),
                            );
                          } else {
                            customReplacmentNaviagte(
                              context,
                              const StartScreen(),
                            );
                          }
                        },
                        width: 90,
                        height: 48,
                        child: Expanded(
                          child: Text(
                            state.currentPageIndex == state.pages.length - 1
                                ? "Get Started"
                                : "Next",
                            style: TextStyles.lato400s16.copyWith(
                              color: AppPalete.text,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
              ],
            );
          },
        ),
      ),
    );
  }
}
