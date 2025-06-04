import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/views/onBoarding/bloc/on_boarding_bloc.dart';
import 'package:to_do_app/widgets/onBoarding/circleDot_widget.dart';
import 'package:to_do_app/widgets/onBoarding/content_container_widget.dart';
import 'package:to_do_app/widgets/onBoarding/on_boarding_buttons.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnBoardingBloc>();
          return BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Container(
                    height: context.getHight(),
                    clipBehavior: Clip.none,
                    // color: onboardingController.toggleBackgroundColor(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (bloc.currentIndex != 3)
                          Expanded(
                            child: Container(
                              width: context.getWight(),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(bloc.imagePath),
                                ),
                              ),
                            ),
                          ),

                        Container(
                          height: bloc.currentIndex == 3
                              ? null
                              : context.getHight(pre: 0.5),
                          width: (MediaQuery.sizeOf(context).width),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 16),
                              if (bloc.currentIndex != 3)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 4,
                                  children: [
                                    ...List.generate(
                                      bloc.contents.length,
                                      (index) => CircleDot(
                                        isActive: bloc.currentIndex == index,
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 16),
                              // show text from list in bloc
                              Container(
                                padding: EdgeInsets.all(16),
                                color: AppColors.background,
                                height: bloc.currentIndex == 3
                                    ? context.getHight(pre: 0.8)
                                    : context.getHight(pre: 0.4),
                                child: PageView.builder(
                                  itemCount: bloc.contents.length,
                                  controller: bloc.onboardingController,
                                  onPageChanged: (value) {
                                    bloc.add(ChangeCurrentIndex(index: value));
                                  },
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ContentContainerWidget(
                                          title: bloc
                                              .contents["screen${bloc.currentIndex + 1}"]!['title']!,
                                          subTitle: bloc
                                              .contents["screen${bloc.currentIndex + 1}"]!['subTitle']!,
                                        ),
                                        OnBoardingButtons(
                                          currentIndex: bloc.currentIndex,
                                          firstOnTap: () {
                                            bloc.add(BackView());
                                          },
                                          secondOnTap: () {
                                            bloc.add(NextView());
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
