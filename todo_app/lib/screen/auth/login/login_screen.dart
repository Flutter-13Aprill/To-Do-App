import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screen/auth/login/bloc/login_bloc.dart';
import 'package:todo_app/screen/auth/signup/signup_screen.dart';
import 'package:todo_app/screen/home/home_screen.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_button.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_scond_text.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>();
          final formKey = GlobalKey<FormState>();
          return SafeArea(
            child: Scaffold(
              body: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  if (state is LoginSuccessState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
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
                            validator:
                                (p0) =>
                                    p0!.isEmpty ? 'Username is required' : null,
                            hintText: 'Enter your Username',
                            controller: bloc.userController,
                            onChanged: (val) {},
                          ),
                          SizedBox(height: 20),
                          CustomScondText(text: 'Password'),
                          SizedBox(height: 16),
                          CustomTextField(
                            validator:
                                (p0) =>
                                    p0!.length < 8
                                        ? 'Password must be at least 8 characters'
                                        : null,
                            hintText: '......',
                            obscureText: true,
                            controller: bloc.passController,
                            onChanged: (val) {},
                          ),
                          SizedBox(height: 60),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: 327,
                              child: CustomButton(
                                text: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    bloc.add(LoginSubmittedEvent());
                                  }
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomScondText(
                                color: ColorsApp.secondText,
                                text: 'Don’t have an account?',
                              ),
                              CustomTextButton(
                                color: ColorsApp.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SignupScreen(),
                                    ),
                                  );
                                },
                                fontSize: 12,
                                text: 'Register',
                              ),
                            ],
                          ),
                        ],
                      ),
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
