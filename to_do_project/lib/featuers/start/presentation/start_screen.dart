import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/function/navigator.dart';
import 'package:to_do_project/core/text/app_text.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/featuers/auth/presentation/pages/log_in_screen.dart';
import 'package:to_do_project/featuers/auth/presentation/pages/register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppPalete.text),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(AppText.startTitle, style: TextStyles.lato700),
            Gap(20),
            Text(
              AppText.startSubTitle,
              style: TextStyles.lato400s16,
              textAlign: TextAlign.center,
            ),
            Gap(450),
            CustomElvatedButton(
              press: () {
                customReplacmentNaviagte(context, LogInScreen());
              },
              child: Text("LOGIN"),
              width: 327,
              height: 48,
            ),
            Gap(20),
            CustomElvatedButton(
              press: () {
                customReplacmentNaviagte(context, RegisterScreen());
              },
              child: Text("Create account"),
              width: 327,
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
