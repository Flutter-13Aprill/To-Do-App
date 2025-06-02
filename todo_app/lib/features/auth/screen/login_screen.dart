import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/bloc/auth_bloc.dart';
import 'package:todo_app/features/auth/screen/signup_screen.dart';
import 'package:todo_app/features/auth/widgets/text_field_widget.dart';
import 'package:todo_app/features/nav/navigation_bar_screen.dart';
import 'package:todo_app/style/style_text.dart';

/// This file defines the LoginScreen widget for user authentication.
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: _keyForm,
                    child: Builder(
                      builder: (context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text('Login', style: StyleText.latoBold38),

                            Text('Username', style: StyleText.latoBold16),

                            TextFieldWidget(
                              controller: bloc.userNameController,
                              textHint: 'Enter your Username',
                            ),
                            Text('Password', style: StyleText.latoBold16),

                            TextFieldWidget(
                              controller: bloc.passwordController,
                              textHint: 'Enter your password',
                            ),

                            BlocListener<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is SuccessState) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => NavigationBarScreen(),
                                    ),
                                  );
                                } else if (state is ErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.msg)),
                                  );
                                }
                              },
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                onPressed: () {
                                  bloc.add(LogInEvent());
                                },
                                child: Text(
                                  'Login',
                                  style: StyleText.latoRegular16,
                                ),
                              ),
                            ),

                            Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: StyleText.latoRegular16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register',
                                      style: StyleText.latoRegular16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
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
