import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/style/my_style.dart';
import 'package:to_do_app/views/layout/layout.dart';
import 'package:to_do_app/views/signin_signup_view/bloc/auth_bloc.dart';
import 'package:to_do_app/widgets/mainButton_widget.dart';
import 'package:to_do_app/widgets/textFiled/text_filed_widget.dart';

class SigninSignupView extends StatelessWidget {
  const SigninSignupView({super.key, this.isSignin = true});
  final bool isSignin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Builder(
                builder: (context) {
                  final bloc = context.read<AuthBloc>()..isSignin = isSignin;

                  return BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessfully) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Layout()),
                        );
                      }
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyleApp.sizeH48,
                              Text(
                                isSignin ? "Login" : "Register",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              StyleApp.sizeH8,

                              SizedBox(height: 42),
                              Form(
                                key: bloc.formKey,
                                child: Column(
                                  children: [
                                    TextFiledWidget(
                                      validator: bloc.validatorUserName,
                                      onChange: (p0) {
                                        bloc.userName = p0;
                                        bloc.add(Validate());
                                      },
                                      label: 'UserName',
                                      hintText: "Enter your username",
                                    ),

                                    SizedBox(height: 32),
                                    TextFiledWidget(
                                      validator: bloc.validatorPassword,
                                      onChange: (p0) {
                                        bloc.password = p0;
                                        bloc.add(Validate());
                                      },
                                      label: 'Password',
                                      hintText: "Enter your password",
                                      obscureText: true,
                                    ),
                                    StyleApp.sizeH32,
                                    if (!isSignin)
                                      TextFiledWidget(
                                        validator: bloc.validatorPassword,
                                        onChange: (p0) {
                                          bloc.confirmPassword = p0;
                                          bloc.add(Validate());
                                        },
                                        label: 'Confirm Password',

                                        hintText: "Confirm Password",

                                        obscureText: true,
                                      ),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    StyleApp.sizeH32,

                                    SizedBox(height: 32),
                                    MainButtonWidget(
                                      onTap: () async {
                                        bloc.add(Authenticate());
                                      },
                                      text: isSignin ? "Sign in" : "Sign Up",
                                      width: 326,
                                    ),

                                    TextButton(
                                      child: Text(
                                        "${isSignin ? "Don’t" : "Do you"} have an account?${isSignin ? "Register" : "Sign in"} ",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SigninSignupView(
                                                  isSignin: isSignin
                                                      ? false
                                                      : true,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "skip for test",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Layout(),
                                          ),
                                        );
                                      },
                                    ),
                                    // SizedBox(height: 32),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
