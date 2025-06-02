import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screen/auth/login/login_screen.dart';
import 'package:todo_app/screen/auth/signup/bloc/signup_bloc.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_button.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_scond_text.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SignupBloc>();
          final formKey = GlobalKey<FormState>();

          return SafeArea(
            child: Scaffold(
              body: BlocListener<SignupBloc, SignupState>(
                listener: (context, state) {
                  if (state is SignupErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  if (state is SignupSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Signup successful!'),
                        backgroundColor: ColorsApp.primary,
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        CustomMainText(text: 'Login'),
                        SizedBox(height: 24),
                        CustomScondText(text: 'Username'),
                        SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Enter your Username',
                          controller: bloc.userController,
                          onChanged: (val) {},
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Username is required";
                            } else if (p0.length < 3) {
                              return 'Username must be at least 3 characters';
                            } else if (!RegExp(
                              r'^[a-zA-Z0-9]+$',
                            ).hasMatch(p0)) {
                              return "Username can only contain letters and numbers";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomScondText(text: 'Password'),
                        SizedBox(height: 16),
                        CustomTextField(
                          obscureText: true,
                          hintText: '......',
                          controller: bloc.passController,
                          onChanged: (val) {},
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            final pattern = RegExp(
                              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~%^()_+=\-]).{8,}$',
                            );

                            if (!pattern.hasMatch(value)) {
                              return 'Password must be at least 8 characters and include uppercase, lowercase, number, and special character';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomScondText(text: 'Confirm Password'),
                        SizedBox(height: 16),
                        CustomTextField(
                          obscureText: true,
                          hintText: '......',
                          controller: bloc.confirmpassController,
                          onChanged: (val) {},
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Please confirm your password';
                            } else if (p0 != bloc.passController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 60),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 327,
                            child: CustomButton(
                              text: 'Sign Up',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  bloc.add(SignupSubmittedEvent());
                                }
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextButton(
                              color: ColorsApp.secondText,
                              onPressed: () {},
                              fontSize: 12,
                              text: 'Already have an account?',
                            ),
                            CustomTextButton(
                              color: ColorsApp.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                );
                              },
                              fontSize: 12,
                              text: 'Login',
                            ),
                          ],
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
