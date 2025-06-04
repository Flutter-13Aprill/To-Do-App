import 'package:flutter/material.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/login_register/screens/login_screen.dart';
import 'package:todoapp/login_register/screens/register.dart';
import 'package:todoapp/theems/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              Text(
                "Welcome to UpTodo",
                style: TextStyle(
                  color: MyAppColor.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Please login to your account or create \n new account to continue",
                style: TextStyle(color: MyAppColor.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Spacer(),

              NextButton(
                button_text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                color: const Color.fromARGB(255, 93, 47, 173),
                textColor: Colors.white,
                width: 360,
              ),
              SizedBox(height: 20),
              NextButton(
                button_text: 'Create account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                color: Colors.transparent,
                textColor: Colors.white,
                width: 360,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
