import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/bloc/auth_bloc.dart';
import 'package:todo_app/features/auth/screen/login_screen.dart';
import 'package:todo_app/features/auth/widgets/text_field_widget.dart';
import 'package:todo_app/features/loading/loading_screen.dart';
import 'package:todo_app/style/style_text.dart';

/// This file defines the SignupScreen widget for user registration.
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
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
                            Text('Register', style: StyleText.latoBold38),

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
                            Text(
                              'Confirm Password',
                              style: StyleText.latoBold16,
                            ),

                            TextFieldWidget(
                              controller: bloc.conpasswordController,
                              textHint: 'Conform your password',
                            ),
                            BlocListener<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is SuccessState) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingScreen(),
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
                                  bloc.add(SignUpEvent());
                                },
                                child: Text(
                                  'Register',
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
                                  'Already have an account? ',
                                  style: StyleText.latoRegular16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Login',
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
