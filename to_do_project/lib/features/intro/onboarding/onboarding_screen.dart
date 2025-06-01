import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/features/intro/onboarding/bloc/onboarding_bloc.dart';
import 'package:to_do_project/features/intro/welcome/welcome_screen.dart';
import 'package:to_do_project/models/app_model.dart';
import 'package:to_do_project/widgets/onboarding_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> pages = [
      const OnboardingModel(
        title: 'Manage your tasks',
        subtitle:
            'You can easily manage all of your daily tasks in DoMe for free',
        imagePath: 'assets/images/onboarding1.png',
      ),
      const OnboardingModel(
        title: 'Create daily routine',
        subtitle:
            'In Uptodo you can create your personalized routine to stay productive.',
        imagePath: 'assets/images/onboarding2.png',
      ),
      const OnboardingModel(
        title: 'Orgonaize your tasks',
        subtitle:
            'You can organize your daily tasks by adding them into categories.',
        imagePath: 'assets/images/onboarding3.png',
      ),
    ];

    final pageController = PageController();

    return BlocProvider(
      create: (_) => OnboardingBloc(totalPages: pages.length)
        ..add(OnboardingPageChanged(0)), // important for showing/hiding BACK
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              final bloc = context.read<OnboardingBloc>();

              return Stack(
                children: [
                  // SKIP top-left
                  Positioned(
                    top: 16,
                    left: 16,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WelcomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  // PageView + dots
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: pages.length,
                          onPageChanged: (index) {
                            bloc.add(OnboardingPageChanged(index));
                          },
                          itemBuilder: (context, index) {
                            return OnboardingPage(data: pages[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      OnboardingDots(
                        currentIndex: state.currentPage,
                        count: pages.length,
                      ),
                    ],
                  ),

                  // BACK bottom-left
                  if (!state.isFirstPage)
                    Positioned(
                      bottom: 24,
                      left: 24,
                      child: TextButton(
                        onPressed: () {
                          bloc.add(OnboardingBackPressed());
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'BACK',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),

                  // NEXT / GET STARTED bottom-right
                  Positioned(
                    bottom: 24,
                    right: 24,
                    child: SizedBox(
                      width: state.isLastPage ? 150 : 90,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          if (state.isLastPage) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WelcomeScreen(),
                              ),
                            );
                          } else {
                            bloc.add(OnboardingNextPressed());
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          state.isLastPage ? 'GET STARTED' : 'NEXT',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
