import 'package:flutter/material.dart';
import 'package:to_do_app/views/signin_signup_view/signin_signup_view.dart';

import 'package:to_do_app/widgets/mainButton_widget.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({
    super.key,
    required this.currentIndex,
    required this.firstOnTap,
    required this.secondOnTap,
  });
  final int currentIndex;
  final Function firstOnTap;
  final Function secondOnTap;
  @override
  Widget build(BuildContext context) {
    if (currentIndex != 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainButtonWidget(
            onTap: firstOnTap,
            isBack: true,
            text: "back",
            width: 90,
          ),
          MainButtonWidget(onTap: secondOnTap, text: "next", width: 90),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainButtonWidget(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SigninSignupView()),
            );
          },
          text: "LOGIN",
          width: 327,
        ),
        MainButtonWidget(
          onTap: () {
            print("object");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SigninSignupView(isSignin: false),
              ),
            );
          },
          isBack: true,
          text: "Create account",
          width: 327,
        ),
      ],
    );
  }
}
