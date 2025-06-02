import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen2/bloc/intro2_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_) => Intro2Bloc(),
      child: BlocListener<Intro2Bloc, Intro2State>(
        listener: (context, state){
          if(state is ButtonAlreadyPressed){
         
            Navigator.popAndPushNamed(context, '/intro4');
          }
          if (state is BackButtonAlreadyPressed){

           Navigator.popAndPushNamed(context, '/intro2');
          }
        },
          child: Scaffold(
      backgroundColor: AppColors.darkBackground,
    body: Column(children: [
      SizedBox(height: 60,),
      Row(children: [
            SizedBox(width: 40,),
        Text("SKIP",style: AppFonts.fontSizeTen)
      ],),
      SizedBox(height: 32,),
      Image.asset("lib/assets/images/introImages/intro2.png", ),
         SizedBox(height: 48,),
         Image.asset("lib/assets/images/introImages/NAV-2.png"),
      SizedBox(height: 48,),
      Text("Create daily routine", style: AppFonts.fontSizeTwo,),
       SizedBox(height: 28,),
        Text("In Uptodo you can create your", style: AppFonts.fontSizeThree,),
        Row(children: [
          SizedBox(width: 75,),
                  Text("personalized routine to stay productive", style: AppFonts.fontSizeThree,),
        ],),
       SizedBox(height: 200,),
      Row(children: [
          SizedBox(width: 18,),
          Builder(
            builder: (context) {
              return ElevatedButton(onPressed: (){
                 context.read<Intro2Bloc>().add(BackButtonPressed());
                      }, 
                      style:ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
               minimumSize: Size(90, 48), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), 
                  ),
                  padding: EdgeInsets.zero,
                      ),
                      child: Text("BACK",style: AppFonts.fontSizeTen),
                      );
            }
          ),
         SizedBox(width: 200,),
        Builder(
          builder: (context) {
            return ElevatedButton(onPressed: (){
              context.read<Intro2Bloc>().add(ButtonPressed());
            }, 
            style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.lilac,
              foregroundColor: Colors.white,
               minimumSize: Size(90, 48), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), 
                ),
                padding: EdgeInsets.zero,
            ),
            child: Text("NEXT",style: AppFonts.fontSizeThree ),
            );
          }
        ),
      ],)
    ],)
        
    )
        
        ),
      );
    
    
  
  }
}
 