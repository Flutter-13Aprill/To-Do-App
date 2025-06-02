import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/bottomnav/bottom_nav_screen.dart';
import 'package:todo_list/screens/login/login_screen.dart';
import 'package:todo_list/screens/signup/bloc/signup_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/custom_text_field_Widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<SignupBloc>();

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
                          "register".tr(),
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
                                    return 'username_required'.tr();
                                  } else if (value.length < 3) {
                                    return 'username_too_short'.tr();
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
                                    return 'password_required'.tr();
                                  } else if (value.length < 8) {
                                    return 'password_too_short'.tr();
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  bloc.add(PasswordChanged(value));
                                },
                              ),
                              AppSpacing.h24,
                              Text(
                                "confirm_password".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                ),
                              ),
                              AppSpacing.h8,
                              CustomTextFieldWidget(
                                controller: bloc.confirmPassController,
                                hintText: "******************",
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'confirm_password_required'.tr();
                                  } else if (value !=
                                      bloc.passController.text) {
                                    return 'passwords_do_not_match'.tr();
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  bloc.add(ConfirmPasswordChanged(value));
                                },
                              ),

                              AppSpacing.h48,

                              BlocBuilder<SignupBloc, SignupState>(
                                builder: (context, state) {
                                  final isEnabled = state is SignupSuccess;

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
                                        bloc.add(SignUpEvent());

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => BottomNavScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "register".tr(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                              AppSpacing.h32,

                              Align(
                                alignment: Alignment.center,
                                child: Text.rich(
                                  TextSpan(
                                    text: "${'already_have_account'.tr()} ",
                                    style: TextStyle(
                                      color: AppColors.mediumGray,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'login'.tr(),
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
                                                            LoginScreen(),
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
