import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/authentication/presentation/start_screen.dart';
import 'package:uptodo/features/onboarding/logic/bloc/onboarding_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/onboarding/presentation/widgets/onboarding_main_section.dart';
import 'package:uptodo/features/onboarding/presentation/widgets/page_indictor.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {

          final onboardingBloc = context.read<OnboardingBloc>();
          final textPageController = onboardingBloc.textPageController;
          final imagePageController = onboardingBloc.imagePageController;

          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [

                    GestureDetector(
                      onTap: () => context.goToWithReplacement(screen: StartScreen()),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(tr('onboarding_screen.skip'), style: TextStyles.lato40018.copyWith( color: AppPalette.tertiaryTextColor)),
                      ),
                    ),

                    EmptySpace.sizeH24,

                    SizedBox(
                      height: context.getHeight(multiplied: 0.3),
                      child: PageView(
                        controller: onboardingBloc.imagePageController,
                        onPageChanged: (value) {
                          onboardingBloc.textPageController.animateToPage(value, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                          onboardingBloc.add(PageChangedEvent(index: value));
                        },
                        children: [
                          SvgPicture.asset('assets/visuals/onboarding/svgs/first.svg', width: context.getHeight(multiplied: 0.9),),
                          SvgPicture.asset('assets/visuals/onboarding/svgs/second.svg', width: context.getHeight(multiplied: 0.9)),
                          SvgPicture.asset('assets/visuals/onboarding/svgs/third.svg', width: context.getHeight(multiplied: 0.9)),
                        ],
                      ),
                    ),

                    EmptySpace.sizeH48,

                    BlocBuilder<OnboardingBloc, OnboardingState>(
                      builder: (context, state) {
                        return PageIndictor(pageIndex: onboardingBloc.currentIndex);
                      },
                    ),

                    EmptySpace.sizeH48,

                    SizedBox(
                      height: context.getHeight(multiplied: 0.2),
                      child: PageView(
                        controller: textPageController,
                        onPageChanged: (value) {
                          imagePageController.animateToPage(value, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                          onboardingBloc.add(PageChangedEvent(index: value));
                        },
                        children: [
                          OnboardingMiddleSection(title: tr('onboarding_screen.first_title'), body: tr('onboarding_screen.first_body')),
                          OnboardingMiddleSection(title: tr('onboarding_screen.second_title'), body: tr('onboarding_screen.second_body')),
                          OnboardingMiddleSection(title: tr('onboarding_screen.third_title'), body: tr('onboarding_screen.third_body'))
                        ],
                      ),
                    ),

                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        TextButton(
                          onPressed: (){
                            imagePageController.animateToPage(onboardingBloc.currentIndex - 1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                            textPageController.animateToPage(onboardingBloc.currentIndex - 1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                          }, 
                          style: TextButton.styleFrom(
                            side: BorderSide.none
                          ),
                          child:Text(tr('onboarding_screen.back'),style: TextStyles.lato40018.copyWith(color: AppPalette.secondaryTextColor))
                          ),

                        ElevatedButton(
                          onPressed: (){

                            if(onboardingBloc.currentIndex == 2){
                              context.goToWithReplacement(screen: StartScreen());
                            }

                            imagePageController.animateToPage(onboardingBloc.currentIndex + 1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                            textPageController.animateToPage(onboardingBloc.currentIndex + 1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                          }, 
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(4)
                            )
                          ),
                          child: Text(tr('onboarding_screen.next')))
                      ],
                    ),

                    EmptySpace.sizeH32
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
