import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/bottomnav/bottom_nav_screen.dart';
import 'package:todo_list/screens/login/bloc/login_bloc.dart';
import 'package:todo_list/screens/signup/signup_screen.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/custom_text_field_Widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>();

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        AppSpacing.h32,
                        Text(
                          "login".tr(),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteTransparent,
                          ),
                        ),
                        AppSpacing.h32,

                        Form(
                          key: bloc.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "username".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                ),
                              ),
                              AppSpacing.h8,
                              CustomTextFieldWidget(
                                controller: bloc.usernameController,
                                hintText: "enter_username",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'username_validation'.tr();
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  bloc.add(UsernameChanged(value));
                                },
                              ),
                              AppSpacing.h24,
                              Text(
                                "password".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                ),
                              ),
                              AppSpacing.h8,
                              CustomTextFieldWidget(
                                controller: bloc.passController,
                                hintText: "******************",
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter_password'.tr();
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  bloc.add(PasswordChanged(value));
                                },
                              ),
                              AppSpacing.h72,
                              BlocConsumer<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginSuccess) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const BottomNavScreen(),
                                      ),
                                    );
                                  } else if (state is LoginFailure) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.error),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  final isEnabled = state is InputSuccess;

                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          isEnabled
                                              ? AppColors.purple
                                              : AppColors.darkPurple,
                                      minimumSize: Size(
                                        context.getWidth(factor: 0.9),
                                        context.getHeight(factor: 0.055),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!isEnabled) return;

                                      if (bloc.formKey.currentState!
                                          .validate()) {
                                        bloc.add(LoginButtonPressed());
                                      }
                                    },

                                    child: Text(
                                      "login".tr(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              AppSpacing.h32,

                              Align(
                                alignment: Alignment.center,
                                child: Text.rich(
                                  TextSpan(
                                    text: "${'no_account'.tr()} ",

                                    style: TextStyle(
                                      color: AppColors.mediumGray,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'register'.tr(),
                                        style: TextStyle(
                                          color: AppColors.whiteTransparent,
                                        ),
                                        recognizer:
                                            TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            SignupScreen(),
                                                  ),
                                                );
                                              },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
