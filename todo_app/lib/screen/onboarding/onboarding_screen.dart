import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screen/onboarding/bloc/onboarding_bloc.dart';
import 'package:todo_app/screen/auth/signup/signup_screen.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_button.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_scond_text.dart';
import 'package:todo_app/widget/custom_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboardingBloc>();
          return BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomTextButton(
                          onPressed: () {
                            bloc.pageController.jumpToPage(
                              bloc.pages.length - 1,
                            );
                            bloc.add(PageChangedEvent(bloc.pages.length - 1));
                          },
                          text: 'SKIP',
                          fontSize: 16,
                        ),
                      ),

                      Expanded(
                        child: PageView.builder(
                          controller: bloc.pageController,
                          onPageChanged: (value) {
                            bloc.add(PageChangedEvent(value));
                          },
                          itemCount: bloc.pages.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  bloc.pages[index]['image']!,
                                  height: 250,
                                ),
                                const SizedBox(height: 24),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(bloc.pages.length, (
                                    index,
                                  ) {
                                    return Container(
                                      height: 4,
                                      width: 26,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            state.currentPage == index
                                                ? ColorsApp.white
                                                : ColorsApp.secondText,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 24),
                                CustomMainText(
                                  text: bloc.pages[index]['title']!,
                                ),
                                const SizedBox(height: 16),
                                Center(
                                  child: CustomScondText(
                                    text: bloc.pages[index]['subtitle']!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButton(
                            onPressed: () {
                              if (state.currentPage > 0) {
                                bloc.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                bloc.add(
                                  PageChangedEvent(state.currentPage - 1),
                                );
                              }
                            },
                            fontSize: 16,
                            text: 'BACK',
                          ),
                          CustomButton(
                            text:
                                state.currentPage == bloc.pages.length - 1
                                    ? 'GET STARTED'
                                    : 'NEXT',
                            onPressed: () {
                              if (state.currentPage < bloc.pages.length - 1) {
                                bloc.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                bloc.add(
                                  PageChangedEvent(state.currentPage + 1),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
