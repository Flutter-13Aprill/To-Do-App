import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/style/my_style.dart';
import 'package:to_do_app/view/auth/signin_signup_view/bloc/auth_bloc.dart';
import 'package:to_do_app/view/layout/layout.dart';
import 'package:to_do_app/widget/auth/text_filed_auth_widget.dart';
import 'package:to_do_app/widget/mainButton_widget.dart';

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
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bloc = context.read<AuthBloc>();
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
                              TextFiledAuthWidget(
                                validator: bloc.validatorEmail,
                                onChange: (p0) {
                                  bloc.userName;
                                  bloc.add(Validate());
                                },
                                label: 'UserName',
                                hintText: "Enter your username",
                              ),

                              SizedBox(height: 32),
                              TextFiledAuthWidget(
                                validator: bloc.validatorPassword,
                                onChange: (p0) {
                                  bloc.password;
                                  bloc.add(Validate());
                                },
                                label: 'Password',
                                hintText: "Enter your password",
                                obscureText: true,
                              ),
                              StyleApp.sizeH32,
                              if (!isSignin)
                                TextFiledAuthWidget(
                                  validator: bloc.validatorPassword,
                                  onChange: (p0) {
                                    bloc.password;
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
                                onTap: () {
                                  bloc.add(SignUp());
                                  // if (bloc.isValid!) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Layout(),
                                      ),
                                    );
                                  // }
                                },
                                text: isSignin ? "Sign in" : "Sign Up",
                                width: 326,
                              ),

                              TextButton(
                                child: Text(
                                  "${isSignin ? "Don’t" : "Do you"} have an account?${isSignin ? "Register" : "Sign in"} ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SigninSignupView(
                                        isSignin: isSignin ? false : true,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "skip for test",
                                  style: Theme.of(context).textTheme.bodySmall,
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
            ),
          ),
        ),
      ),
    );
  }
}
