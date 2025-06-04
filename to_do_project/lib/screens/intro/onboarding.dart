import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/screens/intro/bloc/onboarding_bloc.dart';
import 'package:to_do_project/screens/intro/bloc/onboarding_events.dart';
import 'package:to_do_project/screens/intro/bloc/onboarding_states.dart';
import 'package:to_do_project/screens/intro/srart_screen.dart';
import 'package:to_do_project/style/color_theme.dart';

class Onboarding extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 31, 30, 1),
        body: BlocBuilder<OnboardingBloc, OnboardingStates>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    state.pageIndex = value;
                    BlocProvider.of<OnboardingBloc>(
                      context,
                    ).add(OnboardingEvents());
                  },
                  children: [
                    page(
                      context: context,
                      pageIndex: 0,
                      imageUrl: 'assets/small-onboarding.png',
                      title: 'Manage your tasks',
                      desc:
                          'You can easily manage all of your daily tasks in DoMe for free',
                    ),
                    page(
                      context: context,
                      pageIndex: 1,
                      imageUrl: 'assets/onbarding2.png',
                      title: 'Create daily routine',
                      desc:
                          'In Uptodo  you can create your personalized routine to stay productive',
                    ),
                    page(
                      context: context,
                      pageIndex: 2,
                      imageUrl: 'assets/onbarding3.png',
                      title: 'Orgonaize your tasks',
                      desc:
                          'You can organize your daily tasks by adding your tasks into separate categories',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 150,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position:
                        BlocProvider.of<OnboardingBloc>(
                          context,
                        ).state.pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.white,
                      activeColor: Colors.white,
                      size: const Size.square(4.0),
                      activeSize: const Size(16.0, 4.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget page({
    required pageIndex,
    required imageUrl,
    required title,
    required desc,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl),
        const SizedBox(height: 40),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(height: 120),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return LoginScreen();
                  //     },
                  //   ),
                  // );
                  controller.animateToPage(
                    pageIndex - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
                child: Container(
                  width: 60,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: AppColors.none,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: const Text(
                    'BACK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  pageIndex == 2
                      ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SrartScreen();
                          },
                        ),
                      )
                      : controller.animateToPage(
                        pageIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      );
                },
                child:
                    pageIndex == 2
                        ? Container(
                          width: 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: const Text(
                            'GET STARTED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                        : Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'NEXT',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
