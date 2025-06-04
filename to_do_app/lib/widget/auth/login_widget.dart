import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screen/bottom_navigation/bottom_navigation_screen.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/button/purple_button.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Username", style: AppTextStyles.subText).tr(),
          SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "eamil is empty".tr();
                }
                return null;
              },
              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: AppColors.dark,
                filled: true,
                hintText: "Enter your Username".tr(),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text("Password", style: AppTextStyles.subText).tr(),
          SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is Empty".tr();
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters long. Please try again";
                } else if (!value.contains(RegExp(r'\d'))) {
                  return "Please include at least one number";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: AppColors.dark,
                filled: true,
                hintText: "Enter your Password".tr(),
              ),
            ),
          ),
          SizedBox(height: 69),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(),
                  ),
                );
              }
            },
            child: PurpleButton(horizontal: 135, vertical: 12, name: "Login"),
          ),
        ],
      ),
    );
  }
}
