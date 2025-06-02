import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen2/bloc/intro2_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

class IntroScreen5 extends StatelessWidget {
  const IntroScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_) => Intro2Bloc(),
      child: BlocListener<Intro2Bloc, Intro2State>(
        listener: (context, state){
          if(state is ButtonAlreadyPressed){
         
            Navigator.popAndPushNamed(context, '/login');
          }
          if (state is BackButtonAlreadyPressed){

           Navigator.popAndPushNamed(context, '/signin');
          }
        },
    
    
  
   child:  Scaffold(
backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        leading: IconButton(onPressed: (){}, icon: Image.asset("lib/assets/icons/arrow-left.png"))
      ),
    
      body: Center(
        child: Column(children: [
          SizedBox(height: 40,),
        Text("Welcome to UpTodo", style: AppFonts.fontSizeTwo,),
          SizedBox(height: 26,),
        Text("Please login to your account or create", style: AppFonts.fontSizeThree,),
        Text("new account to continue", style: AppFonts.fontSizeThree,),
         SizedBox(height: 460,),
          Builder(
            builder: (context) {
              return ElevatedButton(onPressed: (){
                context.read<Intro2Bloc>().add(ButtonPressed());
              }, 
              style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.lilac,
                foregroundColor: Colors.white,
                 minimumSize: Size(327, 48), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), 
                  ),
                  padding: EdgeInsets.zero,
              ),
              child: Text("LOGIN",style: AppFonts.fontSizeThree ),
              );
            }
          ),
          SizedBox(height: 32,),
         Builder(
              builder: (context) {
                return ElevatedButton(onPressed: (){
                   context.read<Intro2Bloc>().add(BackButtonPressed());
                        }, 
                        style:ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                 minimumSize: Size(327, 48), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                       side:BorderSide(
                        color: AppColors.lilac,
                        width: 2,
                       )
                    ),
                    padding: EdgeInsets.zero,
                        ),
                        child: Text("CREATE ACCOUNT",style: AppFonts.fontSizeTen),
                        );
              }
            ),
             
          
        ],),
      )
   )
   )
    );
  }
}