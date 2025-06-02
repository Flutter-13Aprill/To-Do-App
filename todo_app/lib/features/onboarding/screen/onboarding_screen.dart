import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/features/auth/screen/start_scren.dart';
import 'package:todo_app/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:todo_app/features/onboarding/model/onboarding_content.dart';
import 'package:todo_app/style/style_size.dart';
import 'package:todo_app/style/style_text.dart';

/// Onboarding screen that walks users through app features.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboardingBloc>();
          return Scaffold(
            appBar: AppBar(
              leading: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartScren()),
                  );
                },
                child: Text('SKIP', style: StyleText.latoRegular12Grey),
              ),
            ),

            body: SafeArea(
              child: PageView.builder(
                controller: bloc.pageController,
                itemCount: onboardingContent.length,
                onPageChanged: (index) {
                  bloc.add(PageChanged(index));
                },
                itemBuilder:
                    (context, index) => Builder(
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                onboardingContent[index].imageUrl,
                                height: 400,
                                width: 300,
                                fit: BoxFit.contain,
                              ),

                              SmoothPageIndicator(
                                controller: bloc.pageController,
                                count: onboardingContent.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.white,
                                  dotHeight: 6,
                                  dotWidth: 6,
                                ),
                              ),

                              Text(
                                onboardingContent[index].title.tr(),
                                style: StyleText.latoBold38,
                              ),

                              Text(
                                onboardingContent[index].subTitle.tr(),
                                style: StyleText.latoRegular16,
                                textAlign: TextAlign.center,
                              ),
                              StyleSize.sizeH48,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (bloc.pageNumber > 0) {
                                        bloc.add(PreviousPage());
                                      }
                                    },
                                    child: Text(
                                      'BACK',
                                      style: StyleText.latoRegular16Grey,
                                    ),
                                  ),

                                  ElevatedButton(
                                    onPressed: () {
                                      if (bloc.pageNumber <
                                          onboardingContent.length - 1) {
                                        bloc.add(NextPage());
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => StartScren(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text('NEXT'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
