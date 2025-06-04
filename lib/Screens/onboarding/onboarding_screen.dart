import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/onboarding/onboarding_view.dart';
import 'package:getit/Screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            var bloc = context.read<OnboardingBloc>();
            return Column(
              children: [
                SizedBox(height: context.screenHeight * 0.1),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      bloc.add(SkipOnboarding(context));
                    },
                    child: Text(
                      context.tr("OnboardingScreen.skipButton"),
                      style: TextStyle(color: borderColor, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.7,
                  width: context.screenWidth,
                  child: PageView(
                    controller: bloc.pageController,
                    onPageChanged: (index) {
                      bloc.currentPage = index;
                      bloc.add(ChangeOnboardingPage());
                    },
                    children: [
                      BlocProvider.value(
                        value: bloc,
                        child: OnboardingView(
                          imagePath: "assets/images/onboarding1.png",
                          title: context.tr("OnboardingScreen.tab1Title"),
                          subTitle: context.tr("OnboardingScreen.tab1Subtitle"),
                        ),
                      ),
                      BlocProvider.value(
                        value: bloc,
                        child: OnboardingView(
                          imagePath: "assets/images/onboarding2.png",
                          title: context.tr("OnboardingScreen.tab2Title"),
                          subTitle: context.tr("OnboardingScreen.tab2Subtitle"),
                        ),
                      ),
                      BlocProvider.value(
                        value: bloc,
                        child: OnboardingView(
                          imagePath: "assets/images/onboarding3.png",
                          title: context.tr("OnboardingScreen.tab3Title"),
                          subTitle: context.tr("OnboardingScreen.tab3Subtitle"),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        bloc.add(PreviousButtonPressed());
                      },
                      child: Text(
                        context.tr("OnboardingScreen.backButton"),
                        style: TextStyle(color: borderColor),
                      ),
                    ),
                    SizedBox(width: context.screenWidth * 0.5),
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(NextButtonPressed(context));
                      },
                      child: Text(
                        bloc.currentPage != 2
                            ? context.tr("OnboardingScreen.nextButton")
                            : context.tr("OnboardingScreen.getStartedButton"),
                        style: TextStyle(color: mainText),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
