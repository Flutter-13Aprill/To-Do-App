import 'package:flutter/material.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingScreen()));

    });
    return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center ,crossAxisAlignment: CrossAxisAlignment.center,children: [

        Container(child: Image.asset('assets/images/todosplash.png'),),
        Text('UpTodo',style: context.titleL()!.copyWith(fontSize: 40),)
        

    ],)),);
  }
}