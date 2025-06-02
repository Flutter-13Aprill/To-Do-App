import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/login/login_screen.dart';
import 'package:project6/screens/onboarding/bloc/pages_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/onboarding_indicator.dart';
import 'package:project6/widgets/onboarding_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesBloc(),

      child: BlocBuilder<PagesBloc, PagesState>(
        builder: (context, state) {
          final bloc = context.read<PagesBloc>();

          return Scaffold(
            appBar: AppBar(
              title: Container(
                alignment: Alignment.centerLeft,
                width: 90.w,
                height: 48.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Skip', style: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 271.w,
                    height: 291.h,
                    child: PageView(
                      controller: bloc.textPageController,
                      onPageChanged:
                          (value) => {
                            bloc.pageController.animateToPage(
                              value,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            ),
                            bloc.add(ChangePageEvent(value: value)),
                          },
                      children: [
                        Container(
                          child: Image.asset('assets/images/onboarding1.png'),
                        ),
                        Container(
                          child: Image.asset('assets/images/onboarding2.png'),
                        ),
                        Container(
                          child: Image.asset('assets/images/onboarding3.png'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  OnboardingIndicator(curretPage: bloc.currentIndex),
                  SizedBox(height: 25.h),

                  Container(
                    width: 310.w,
                    height: 250.h,
                    child: PageView(
                      controller: bloc.pageController,

                      onPageChanged: (value) {
                        bloc.textPageController.animateToPage(
                          value,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );

                        bloc.add(ChangePageEvent(value: value));
                      },
                      children: [
                        OnboardingText(
                          setTitle: 'Manage your Tasks',
                          setBody:
                              'You can easily manage all of your daily tasks in DoMe for free',
                        ),
                        OnboardingText(
                          setTitle: 'Create daily routine',
                          setBody:
                              'In Uptodo  you can create your personalized routine to stay productive',
                        ),
                        OnboardingText(
                          setTitle: 'Orgonaize your tasks',
                          setBody:
                              'You can organize your daily tasks by adding your tasks into separate categories',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  SizedBox(
                    width: 350.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 90.w,
                          height: 48.h,
                          child: TextButton(
                            onPressed: () {
                              bloc.pageController.animateToPage(
                                bloc.currentIndex--,
                                duration: Duration(microseconds: 200),
                                curve: Curves.bounceInOut,
                              );
                              bloc.textPageController.animateToPage(
                                bloc.currentIndex--,
                                duration: Duration(microseconds: 200),
                                curve: Curves.bounceInOut,
                              );
                            },
                            child: Text('BACK',style: TextStyle(color: Colors.grey),),
                          ),
                        ),
                        Container(
                          width: 90.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: AppColors().buttonColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (bloc.currentIndex == 2) {
                                print(bloc.currentIndex.toString());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              }
                              bloc.pageController.animateToPage(
                                bloc.currentIndex++,
                                duration: Duration(microseconds: 200),
                                curve: Curves.bounceInOut,
                              );
                              bloc.textPageController.animateToPage(
                                bloc.currentIndex++,
                                duration: Duration(microseconds: 200),
                                curve: Curves.bounceInOut,
                              );
                            },
                            child: Text('NEXT',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
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
