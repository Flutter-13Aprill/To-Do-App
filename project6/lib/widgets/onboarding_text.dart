import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({super.key, required this.setTitle, required this.setBody});

  final String setTitle; 
  final String setBody; 

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(setTitle,style: context.titleL()),
      SizedBox(height: 35.h,),
      Text(setBody,style: context.bodyM(),textAlign: TextAlign.center,),

    ],);
  }
}