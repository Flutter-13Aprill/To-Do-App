import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/login/login_screen.dart';
import 'package:to_do_app/features/auth/registertion/registertion_screen.dart';
import 'package:to_do_app/features/start/widgets/custom_button.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios_new),     
    onPressed: () {
      Navigator.of(context).pop();
    }
    )),
    body: SafeArea(child: 
    Padding(padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 1),vertical: context.getShortest(per: 1)),
    child:Column(children: [
Text('Welcome to UpTodo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: context.getShortest(per: 0.8)),),
SizedBox(height: context.getHeight(per: 0.3)),
Text('Please login to your account or create\n new account to continue',textAlign: TextAlign.center,style: TextStyle(fontSize: context.getShortest(per: 0.35))),
Spacer(),
CustomButton(onTap:(){ context.replacement(LoginScreen());}, buttonColor: AppPalette.purble, borderColor: AppPalette.purble, 
textColor: AppPalette.textColor, text: "LOGIN", fontSize: context.getShortest(per: 0.5), fontWeight: FontWeight.normal,),
SizedBox(height: context.getHeight(per: 0.2)),
CustomButton(onTap:(){context.replacement(RegistertionScreen());}, buttonColor: AppPalette.backgroundColor, borderColor: AppPalette.purble, 
textColor: AppPalette.textColor, text: "Create account", fontSize: context.getShortest(per: 0.5), fontWeight: FontWeight.normal,),
   SizedBox(height: context.getHeight(per: 0.1),),      
    
    ],) ,
    ))
    );
  }
}