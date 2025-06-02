import 'package:flutter/material.dart';
import 'package:to_do_project/screens/index/index_screen.dart';
import 'package:to_do_project/screens/login_and_regiter/register_screen.dart';
// import 'package:to_do_project/screens/login_and_regiter/register.dart';
import 'package:to_do_project/style/color_theme.dart';
import 'package:to_do_project/widgets/custom_botton.dart';
import 'package:to_do_project/widgets/custom_text_field.dart';
// import 'package:to_do_project/widgets/text_themes/body_medium.dart';
import 'package:to_do_project/widgets/text_themes/title_large.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleLarge(text: 'Login'), // screen title
              SizedBox(height: 40.0),

              Text('Username'), // user text field
              SizedBox(height: 8.0),
              CustomTextField(
                controller: userController,
                label: 'Enter your Username',
              ),

              SizedBox(height: 40.0),

              Text('Password'), // password text field
              SizedBox(height: 8.0),
              CustomTextField(
                controller: passwordController,
                label: 'Enter your Password',
              ),
              SizedBox(height: 56.0),

              CustomBotton(
                // login button
                text: 'Register',
                color: AppColors.primaryColor,
                screen: IndexScreen(),
              ),

              SizedBox(height: 32.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Don’t have an account? Register',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
