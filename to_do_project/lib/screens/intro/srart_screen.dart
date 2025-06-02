import 'package:flutter/material.dart';
import 'package:to_do_project/screens/login_and_regiter/login_screen.dart';
import 'package:to_do_project/screens/login_and_regiter/register_screen.dart';
import 'package:to_do_project/style/color_theme.dart';
import 'package:to_do_project/widgets/custom_botton.dart';

class SrartScreen extends StatelessWidget {
  const SrartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Welcome to UpTodo', style: Theme.of(context).textTheme.titleLarge,),
            Text('Please login to your account or create new account to continue', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            SizedBox(height: 400,),
            CustomBotton(text: 'Login', color: AppColors.primaryColor,  screen: LoginScreen()),
            CustomBotton(text: 'CREATE ACCOUNT', color: AppColors.none, border: Border.all(color: AppColors.primaryColor),  screen: RegisterScreen()),
          ],),
      ),
    );
  }
}