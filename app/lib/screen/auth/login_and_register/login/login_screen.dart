import 'package:app/screen/auth/login_and_register/login/bloc/login_bloc.dart';
import 'package:app/screen/auth/login_and_register/register/register_screen.dart';
import 'package:app/screen/auth/login_and_register/widget/button/button.dart';
import 'package:app/screen/auth/login_and_register/widget/texfekd/textfeild.dart';
import 'package:app/screen/index/home_screen.dart';
import 'package:app/screen/nav/botom_nav_bar_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Ensure this import is correct

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(), // Create and provide the LoginBloc
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>(); // Get the bloc instance

          return Scaffold(
            appBar: AppBar(), // Simple AppBar
            body: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                // The listener can be used for side effects.
                // For example, showing a SnackBar on LoginFailure or navigating on LoginSuccess.
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
                    if (state is LoginSuccess) {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => BotomNavBarScreen()));
                 }
              },
              builder: (context, state) {
                // Determine button enabled status from the current BLoC state
                bool isButtonEnabled = false;
                if (state is LoginInitial) {
                  isButtonEnabled = state.isButtonEnabled;
                } else if (state is LoginLoading) {
                  isButtonEnabled = false; // Disable button while loading
                }

                return Form(
                  key: bloc
                      .formKey, // Assign the GlobalKey from the bloc to the Form
                  child: SingleChildScrollView(
                    // Allows scrolling if content overflows (e.g., when keyboard appears)
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ), // Padding for the entire content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align children to the start (left for LTR)
                        children: [
                          Text(
                            "LOGIN".tr(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 30,
                          ), // Increased spacing for better layout

                          Text(
                            "Username".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ), // Small space between label and text field
                          Textfeild(
                            controller: bloc
                                .usernameController, // Pass controller from bloc
                            hint: "Enter your Username",
                            validator: bloc
                                .usernameValidator, // Pass validator from bloc
                            onChanged: (text) {
                              // onChanged just triggers a general update event in the bloc
                              bloc.add(
                                LoginFieldsChanged(),
                              );
                            },
                          ),
                          const SizedBox(height: 20), // Space between fields

                          Text(
                            "Password".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ), // Small space between label and text field
                          Textfeild(
                            controller: bloc
                                .passwordController, // Pass controller from bloc
                            isPassword: true, // This makes the text obscure
                            hint: '. . . . . . . .', // The dots as placeholder
                            validator: bloc
                                .passwordValidator, // Pass validator from bloc
                            onChanged: (text) {
                              // onChanged just triggers a general update event in the bloc
                              bloc.add(
                                LoginFieldsChanged(),
                              );
                            },
                          ),
                          const SizedBox(height: 30), // Space before the button

                          Button(
                            title: "LOGIN",
                            onPressed: () {
                              // Dispatch LoginButtonPressed event to bloc
                              bloc.add(
                                LoginButtonPressed(),
                              );
                            },
                            isEnabled:
                                isButtonEnabled, // Button enabled status from bloc state
                          ),
                          const SizedBox(height: 20), // Space below the button
                          // "Don't have an account? Register" text
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                              },
                              child: Text(
                                "Don't have an account? Register".tr(),
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Colors.white.withOpacity(
                                        0.7,
                                      ), // Semi-transparent white
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), // Bottom padding
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
