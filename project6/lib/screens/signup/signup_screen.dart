import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/login/login_screen.dart';
import 'package:project6/screens/signup/bloc/signup_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/auth_text_field.dart';
import 'package:project6/widgets/bottom_nav/bottom_nav_handler.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          final bloc = context.read<SignupBloc>();
          return Form(
            key: formKey,
            child: Scaffold(
              body: Center(
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 327.w,
                      child: Text('username'.tr(), style: context.bodyM()),
                    ),
                    AuthTextField(
                      textEditingController: bloc.usernameController,

                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'emptyemail'.tr();
                          //input is an eamil
                        } 
                        // else if (!RegExp(
                        //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                        // ).hasMatch(p0)) {
                        //   return 'Please Enter A Valid Email';
                        // }
                         else {
                          return null;
                        }
                      },
                      onChange:
                          (p0) => {
                            bloc.add(CorrectEvent(isTrue: p0.isNotEmpty)),
                          },
                      setHint: 'username'.tr(),
                      isPassword: false,
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      width: 327.w,
                      child: Text('password'.tr(), style: context.bodyM()),
                    ),
                    AuthTextField(
                      textEditingController: bloc.passwordController,
                      setHint: 'password'.tr(),
                      isPassword: true,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'emptyPass'.tr();
                          //input is an eamil
                        } else if (p0.length < 6) {
                          return 'lengPass'.tr();
                        } else {
                          bloc.confirmPassword = p0;
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      width: 327.w,
                      child: Text('conPass'.tr(), style: context.bodyM()),
                    ),
                    AuthTextField(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'emptyPass'.tr();
                          //input is an eamil
                        } else if (p0.length < 6) {
                          return 'lengPass'.tr();
                        } else if (p0 != bloc.confirmPassword) {
                          return 'moMatch'.tr();
                        } else {
                          return null;
                        }
                      },
                      textEditingController: bloc.confirmPasswordController,
                      setHint: 'conPass',
                      isPassword: true,
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color:
                            bloc.isCorrect
                                ? AppColors().buttonColor
                                : Color.fromARGB(126, 134, 135, 231),
                      ),
                      child: TextButton(
                        onPressed:
                            bloc.isCorrect
                                ? () {
                                  print(bloc.isCorrect);
                                  if (formKey.currentState!.validate()) {
                                    print('correct');
                                    bloc.add(SubmitEvent());
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BottomNavHandler(),
                                      ),
                                    );
                                  }
                                }
                                : null,
                        child: Text('signUp'.tr(), style: context.bodyM()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'haveAcc'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(176, 255, 255, 255),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'login'.tr(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
