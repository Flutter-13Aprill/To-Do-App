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
                      child: Text('Username', style: context.bodyM()),
                    ),
                    AuthTextField(
                      textEditingController: bloc.usernameController,

                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please Enter Your Email';
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
                      setHint: 'Username',
                      isPassword: false,
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      width: 327.w,
                      child: Text('Password', style: context.bodyM()),
                    ),
                    AuthTextField(
                      textEditingController: bloc.passwordController,
                      setHint: 'Password',
                      isPassword: true,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please Enter Your Password';
                          //input is an eamil
                        } else if (p0.length < 6) {
                          return 'Please enter password longer than 6 charcters';
                        } else {
                          bloc.confirmPassword = p0;
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      width: 327.w,
                      child: Text('Confirm Password', style: context.bodyM()),
                    ),
                    AuthTextField(
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Please Enter Your Password';
                          //input is an eamil
                        } else if (p0.length < 6) {
                          return 'Please enter password longer than 6 charcters';
                        } else if (p0 != bloc.confirmPassword) {
                          return 'The password dosent match';
                        } else {
                          return null;
                        }
                      },
                      textEditingController: bloc.confirmPasswordController,
                      setHint: 'Confirm Password',
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
                        child: Text('Signup', style: context.bodyM()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
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
                            'Login',
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
