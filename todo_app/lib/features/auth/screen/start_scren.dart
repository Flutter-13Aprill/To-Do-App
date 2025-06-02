import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/screen/login_screen.dart';
import 'package:todo_app/features/auth/screen/signup_screen.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// This file defines the StartScreen widget,
///which is the entry point to login or sign up before accessing the app.
class StartScren extends StatelessWidget {
  const StartScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Column(
                spacing: 16,
                children: [
                  Text('Welcome to UpTodo', style: StyleText.latoBold20),

                  Text(
                    'Please login to your account or create new account to continue',
                    style: StyleText.latoRegular16,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(),
              Column(
                spacing: 16,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Login', style: StyleText.latoRegular16),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: StyleColor.purple, width: 2),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Create account',
                      style: StyleText.latoRegular16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
