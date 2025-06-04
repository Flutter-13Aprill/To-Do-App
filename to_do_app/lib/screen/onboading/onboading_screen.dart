import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/screen/onboading/bloc/onboading_bloc.dart';
import 'package:to_do_app/screen/onboading/start_screen.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/button/purple_button.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tracks the current page index
    return BlocProvider(
      create: (context) => OnboadingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboadingBloc>();

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StartScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.whiteOpacity,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 255,
                    child: PageView(
                      controller: bloc.pageController,

                      children: [
                        Image.asset("images/intro1.png"),
                        Image.asset("images/intro2.png"),
                        Image.asset("images/intro3.png"),
                      ],
                    ),
                  ),

                  SizedBox(height: 42),
                  Container(
                    alignment: Alignment.center,
                    height: 8,
                    child: SmoothPageIndicator(
                      controller: bloc.pageController, // PageController
                      count: 3,
                      effect: SlideEffect(
                        spacing: 8.0,
                        radius: 56,
                        dotWidth: 27,
                        dotHeight: 4,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                      ), // your preferred effect
                      onDotClicked: (index) {},
                    ),
                  ),

                  SizedBox(height: 50),
                  BlocBuilder<OnboadingBloc, OnboadingState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return Column(
                          children: [
                            Text(bloc.mainText, style: AppTextStyles.mainText),
                            SizedBox(height: 42),
                            Text(
                              bloc.subText,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.subText,
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          Text(bloc.mainText, style: AppTextStyles.mainText),
                          SizedBox(height: 42),
                          Text(
                            bloc.subText,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subText,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 140),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          bloc.add(BackIntro());
                        },
                        child:
                            Text(
                              "Back",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.whiteOpacity,
                              ),
                            ).tr(),
                      ),
                      TextButton(
                        onPressed: () {
                          bloc.add(NextIntro());
                          if (bloc.imgValue > 1) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => StartScreen(),
                              ),
                            );
                          }
                        },
                        child: PurpleButton(
                          horizontal: 24,
                          vertical: 12,
                          name: "Next".tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
