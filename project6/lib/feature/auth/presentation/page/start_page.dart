import 'package:flutter/material.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_button.dart';
import 'package:project6/feature/auth/presentation/page/login_page.dart';
import 'package:project6/feature/auth/presentation/page/signup_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 95),

              Text(AppText.welcome, style: TextStyles.lato70032),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: Text(
                  textAlign: TextAlign.center,
                  AppText.welcomeSubTitle,
                  style: TextStyles.lato40016.copyWith(
                    color: AppPalette.white67,
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  context.customPushReplacement(LoginPage());
                },
                height: 48,
                width: context.getWidth(),
                child: Text(AppText.login2, style: TextStyles.lato40016),
              ),
              SizedBox(height: 28),
              CustomButton(
                onPressed: () {
                  context.customPushReplacement(SignupPage());
                },
                height: 48,
                width: context.getWidth(),
                color: AppPalette.blackColor,
                child: Text(AppText.createAccount, style: TextStyles.lato40016),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
