import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/login/bloc/login_bloc.dart';
import 'package:project6/screens/signup/signup_screen.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/auth_text_field.dart';
import 'package:project6/widgets/bottom_nav/bottom_nav_handler.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
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
                          bloc.isCorrect = false;
                          return 'emptyemail'.tr();
                          //input is an eamil
                        }
                        //  else if (!RegExp(
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
                                  if (formKey.currentState!.validate()) {
                                    bloc.add(SubmitEvent());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNavHandler(),
                                      ),
                                    );
                                  }
                                }
                                : null,
                        child: Text('login'.tr(), style: context.bodyM()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'noAcc'.tr(),
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
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'register'.tr(),
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
