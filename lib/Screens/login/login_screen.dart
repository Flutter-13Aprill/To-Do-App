import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/AuthScreens/password_field.dart';
import 'package:getit/CustomWidgets/AuthScreens/username_field.dart';
import 'package:getit/Screens/login/bloc/login_bloc.dart';
import 'package:getit/Screens/signup/sign_up_screen.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                var bloc = context.read<LoginBloc>();
                return Form(
                  key: bloc.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.screenHeight * 0.1),
                        Text(
                          context.tr("LoginScreen.title"),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: mainText,
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.05),
                        UsernameField(
                          controller: bloc.usernameController,
                          hintText: context.tr(
                            'LoginScreen.usernamePlaceholder',
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocProvider<LoginBloc>.value(
                          value: bloc,
                          child: PasswordField(
                            controller: bloc.passwordController,
                            hintText: context.tr(
                              'LoginScreen.passwordPlaceholder',
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              context.tr("LoginScreen.forgotPassword"),
                              style: TextStyle(color: mainText, fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {
                              bloc.add(LoginButtonPressed(context: context));
                            },
                            child: Text(
                              context.tr("LoginScreen.loginButton"),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),
                        RichText(
                          text: TextSpan(
                            text: context.tr("LoginScreen.dontHaveAnAccount"),
                            style: TextStyle(color: mainText, fontSize: 14),
                            children: [
                              TextSpan(
                                text: context.tr("LoginScreen.register"),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to Sign Up screen
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
