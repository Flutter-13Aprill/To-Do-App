import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/widgets/empty_space.dart';

class OnboardingMiddleSection extends StatelessWidget {
  const OnboardingMiddleSection({super.key ,required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        Text(title, style: TextStyles.lato70032),
    
        EmptySpace.sizeH24,
    
        SizedBox(
          width: context.getWidth(multiplied: 0.7),
          child: Text(body, style: TextStyles.lato40018, textAlign: TextAlign.center,)
        )
      ],
    );
  }
}