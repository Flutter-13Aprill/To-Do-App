import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/screen/Intro/intro_screen/Intro_screen.dart';
import 'package:app/screen/Intro/intro_screen/widgtes/button/navigation_button.dart';
import 'package:app/screen/Intro/second_onbording_scree.dart';
import 'package:app/screen/auth/login_and_register/login/login_screen.dart';
import 'package:app/screen/widgets/conatiner/linear_conatiner.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FirstOnbordingScree extends StatelessWidget {
  const FirstOnbordingScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(
            'Skip'.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(
                context,
              ).textTheme.titleMedium!.color!.withOpacity(0.7),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Center(child: Image.asset('assets/images/2.png')),
          SizedBox(height: 40),
          SizedBox(
            height: context.getHeigth() * .005,
            width: context.getWidth() * .5,
            child: Image.asset('assets/images/3.png', fit: BoxFit.cover),
          ),
          SizedBox(height: 35),
          Text(
            "Manage your tasks".tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment(0, 0),
            child: Text(
              "mange".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 215),
          NavigationButton(
            title:  "next",
            pageToGo: SecondOnbordingScree(),
            backPage: IntroScreen(),
          ),
          SizedBox(height: 30),
          LinearConatiner(),
        ],
      ),
    );
  }
}
