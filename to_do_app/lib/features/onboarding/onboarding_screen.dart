import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/bottom_controller/bottom_nav_screen.dart';
import 'package:to_do_app/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:to_do_app/features/start/starting_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _onboardingController = PageController();
return BlocProvider(
  create: (context) => OnboardingBloc(),
  child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  final bool isLastPage = state is OnboardingInitial && state.onLastPage;
                  final bool fristPage  =state is OnboardingInitial && state.onFristPage;
             return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.getShortest(per: 0.5),
            vertical: context.getShortest(per: 0.15),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: (){  _onboardingController.animateToPage((AppText.onboardingContent.length-1), duration:const Duration(milliseconds: 500), curve: Curves.easeIn);}, child: Text(isLastPage ? '':'Skip')),
              Expanded(
                child:   PageView.builder(
                  controller: _onboardingController,
                  itemCount: AppText.onboardingContent.length,
                  onPageChanged: (index) {
                    context
                        .read<OnboardingBloc>()
                        .add(OnboardingPageChanged(index));
                  },
                  itemBuilder: (context, index) {
                    final content = AppText.onboardingContent[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         SizedBox(height: 20),
                        Image.asset(
                          content['image']!,
                          height: context.getHeight(per: 3),
                        ),
                         SizedBox(height: 20),
                        SmoothPageIndicator(
                          controller: _onboardingController,
                          count: AppText.onboardingContent.length,
                          effect: SlideEffect(
                            dotHeight:5 ,
                            dotWidth: 30,
                            spacing:17 ,
                            dotColor: AppPalette.darkGrey,
                            activeDotColor: AppPalette.textColor,
                            type: SlideType.slideUnder,
                          ),
                        ),
                       SizedBox(height: context.getHeight(per: 0.8)),
                        Text(
                          content['title']!.tr(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold,color: AppPalette.textColor),
                        ),
                         SizedBox(height: context.getHeight(per: 0.25)),
                        Text(
                          content['subtitle']!.tr(),
                          style: TextStyle(
                              fontSize: 18, color: AppPalette.textColor),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height:context.getHeight(per: 1.05) ,),
                         SizedBox(
                    
                    height: context.getHeight(per: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         TextButton(onPressed: (){_onboardingController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, child: Text(fristPage ? '' :'Back')),
                        InkWell(
                           onTap: () {
                              if (!isLastPage) {
                                _onboardingController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              } else {
                                context.push(const StartingScreen());
                              }
                            },
                          child: Container(
                            
                            height:context.getShortest(per: 1) ,
                            padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.5)),
                            alignment: Alignment.center,
                           decoration: BoxDecoration(color: AppPalette.purble,borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.14)))),
                            child: Text(
                              isLastPage ? "GET STARTED" : "Next",
                              style: TextStyle(
                                color: AppPalette.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      ],
                    );
                  },
                ))
            ]),
            
        
          ),
        ),
      );
  })
);
  }
}
