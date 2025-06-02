import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/AuthScreens/signup_password_field.dart';
import 'package:getit/CustomWidgets/AuthScreens/singnup_password_confirmation_field.dart';
import 'package:getit/CustomWidgets/AuthScreens/username_field.dart';
import 'package:getit/Screens/signup/bloc/sign_up_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                final bloc = context.read<SignUpBloc>();

                return Form(
                  key: bloc.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.screenHeight * 0.1),
                        Text(
                          context.tr("RegisterScreen.title"),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: mainText,
                          ),
                        ),

                        const SizedBox(height: 48),
                        UsernameField(
                          controller: bloc.usernameController,
                          hintText: context.tr(
                            'RegisterScreen.usernamePlaceholder',
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocProvider<SignUpBloc>.value(
                          value: bloc,
                          child: SignupPasswordField(
                            controller: bloc.passwordController,
                            hintText: context.tr(
                              'RegisterScreen.passwordPlaceholder',
                            ),
                          ),
                        ),

                        SizedBox(height: context.screenHeight * 0.02),
                        BlocProvider<SignUpBloc>.value(
                          value: bloc,
                          child: SingnupPasswordConfirmationField(
                            controller: bloc.confirmPasswordController,
                            hintText: context.tr(
                              'RegisterScreen.passwordPlaceholder',
                            ),
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.02),

                        SizedBox(
                          width: double.infinity,
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              bloc.add(SignUpButtonPressed(context));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "${context.tr("RegisterScreen.alreadyHaveAccount")} ${context.tr("RegisterScreen.loginTextButton")}",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                              ),
                            ),
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
