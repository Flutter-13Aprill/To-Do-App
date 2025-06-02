import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/auth/bloc/auth_bloc.dart';
import 'package:to_do_app/screen/auth/login_screen.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/button/purple_button.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Form(
            key: bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username", style: AppTextStyles.subText).tr(),
                SizedBox(height: 8),
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),

                    controller: bloc.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "userName is empty".tr();
                      }
                      return null;
                    },
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
                  height: 55,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),

                    controller: bloc.passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is Empty".tr();
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long. Please try again";
                      } else if (!value.contains(RegExp(r'\d'))) {
                        return "not Contains a number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: AppColors.dark,
                      filled: true,
                      hintText: "Enter your Password".tr(),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text("Confirm Password", style: AppTextStyles.subText).tr(),
                SizedBox(height: 8),
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    obscureText: true,

                    style: TextStyle(color: Colors.white),

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
                    if (bloc.formKey.currentState!.validate()) {
                      bloc.add(SignUpEvent());
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                  child: PurpleButton(
                    horizontal: 120,
                    vertical: 12,
                    name: "Register".tr(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
