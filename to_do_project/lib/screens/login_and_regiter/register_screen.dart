import 'package:flutter/material.dart';
// import 'package:to_do_project/screens/index/index_screen.dart';
import 'package:to_do_project/screens/login_and_regiter/login_screen.dart';
import 'package:to_do_project/screens/nav/bottom_nav.dart';
import 'package:to_do_project/style/color_theme.dart';
import 'package:to_do_project/widgets/custom_botton.dart';
import 'package:to_do_project/widgets/custom_text_field.dart';
import 'package:to_do_project/widgets/text_themes/title_large.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
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
                controller: userController, ////
                label: 'Enter your Username',
              ),

              SizedBox(height: 40.0),

              Text('Password'), // password text field
              SizedBox(height: 8.0),
              CustomTextField(
                controller: passwordController,  /////
                label: 'Enter your Password',
              ),

              SizedBox(height: 40.0),

              Text('Confirm password'), // password text field
              SizedBox(height: 8.0),
              CustomTextField(
                controller: passwordController,  /////
                label: 'Enter your Password',
              ),

              SizedBox(height: 56.0),

              CustomBotton( // login button
                text: 'Login',
                color: AppColors.primaryColor,
                screen: BottomNav(),
              ),

              SizedBox(height: 32.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
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