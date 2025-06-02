import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_list/screens/login/login_screen.dart';
import 'package:todo_list/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:todo_list/screens/start_screen.dart';
import 'package:todo_list/style/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboardingBloc>();
          final currentLocale = context.locale;
          final isRtl = currentLocale.languageCode == 'en' ? true : false;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      PageView.builder(
                        controller: bloc.pageController,
                        itemCount: bloc.pages.length,
                        onPageChanged: (index) {
                          bloc.add(PageChangeEvent(index: index));
                        },
                        itemBuilder: (context, index) => bloc.pages[index],
                      ),

                      Positioned(
                        left: isRtl ? 5 : null,
                        right: isRtl ? null : 5,

                        top: 50,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "skip".tr(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(fontSize: 18),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 380,
                        left: 0,
                        right: 0,

                        child: Center(
                          child: SmoothPageIndicator(
                            controller: bloc.pageController,
                            count: bloc.pages.length,
                            effect: SlideEffect(
                              dotHeight: 4,
                              dotWidth: 28,
                              dotColor:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.lightGray
                                      : AppColors.lightGray,
                              activeDotColor:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.whiteTransparent
                                      : AppColors.purple,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right: isRtl ? 5 : null,
                        left: isRtl ? null : 5,
                        bottom: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: Size(90, 48),
                          ),
                          onPressed: () {
                            if (bloc.pages.length - 1 == state.index) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StartScreen(),
                                ),
                              );
                            } else {
                              bloc.add(NextPageEvent());
                            }
                          },
                          child: Text(
                            (bloc.pages.length - 1 == state.index)
                                ? "get_started".tr()
                                : "next".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      Positioned(
                        left: isRtl ? 5 : null,
                        right: isRtl ? null : 5,
                        bottom: 20,
                        child: TextButton(
                          onPressed: () {
                            bloc.add(PreviousPageEvent());
                          },
                          child: Text(
                            "back".tr(),
                            style: Theme.of(context).textTheme.bodyMedium!,
                          ),
                        ),
                      ),
                    ],
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
