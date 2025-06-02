import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen1/bloc/intro1_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Intro1Bloc()..add(StartTimer()),
      child: BlocListener<Intro1Bloc, Intro1State>
      (listener: (context, state){
if (state is Intro1Done) {
  Navigator.pushReplacementNamed(context, '/intro2');
}
      },
      
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
body: Center(
  child: Column(
    children: [
      SizedBox(height: 370,),
      Image.asset("lib/assets/images/introImages/check.png"),
      SizedBox(height: 22,),
      Text("UpTodo", style: AppFonts.fontSizeOne,)
    ],
  ),
  
),
      ),

      )
    );
  }
}