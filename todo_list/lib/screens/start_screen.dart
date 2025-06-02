import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/login/login_screen.dart';
import 'package:todo_list/screens/signup/signup_screen.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                "welcome".tr(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteTransparent,
                ),
              ),
              AppSpacing.h32,

              Text(
                "login_or_create".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.lightGray),
              ),
              Spacer(),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      minimumSize: Size(
                        context.getWidth(factor: 0.9),
                        context.getHeight(factor: 0.055),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "login".tr().toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  AppSpacing.h16,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundColor,
                      minimumSize: Size(
                        context.getWidth(factor: 0.9),
                        context.getHeight(factor: 0.055),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: AppColors.purple, width: 2),
                      ),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "create_account".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
