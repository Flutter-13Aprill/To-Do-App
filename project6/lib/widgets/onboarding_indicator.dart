import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.curretPage});

final int curretPage;


// here is onboarding indicator to give style and navigate the current page

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
    3,
    (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(microseconds: 500),
        //give current page extra width
        width: 26.w,
        height: 4.h,
        decoration: BoxDecoration(
          color:
          //change color on select
              index == curretPage
                  ? Color.fromARGB(240, 255, 255, 255)
                  : Color.fromARGB(255, 175, 175, 175),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
          ),);
  }
}