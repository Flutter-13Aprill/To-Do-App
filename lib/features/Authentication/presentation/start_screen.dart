import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/authentication/presentation/login_screen.dart';
import 'package:uptodo/features/authentication/presentation/register_screen.dart';
import 'package:uptodo/features/authentication/presentation/widgets/auth_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          width: context.getWidth(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              EmptySpace.sizeH88,
        
              Text(tr('auth_start_screen.title'), style: TextStyles.lato70032,),
        
              EmptySpace.sizeH24,
        
              SizedBox(
                width: context.getWidth(multiplied: 0.62),
                child: Text(tr('auth_start_screen.body'), style: TextStyles.lato40018, textAlign: TextAlign.center,)
              ),
        
              Spacer(),
        
              AuthButton(label: 'auth_start_screen.login_text', onPressed: () => context.goToWithReplacement(screen: LoginScreen())),
        
              EmptySpace.sizeH32,
        
              TextButton(
                onPressed: () => context.goToWithReplacement(screen: RegisterScreen()),
                style: TextButton.styleFrom(fixedSize: Size(context.getWidth(multiplied: 0.9), context.getWidth(multiplied: 0.1))), 
                child: Text(tr('auth_start_screen.create_account_text'), style: TextStyles.lato40018,
                )),
        
              EmptySpace.sizeH56,
            ],
          ),
        ),
      ),
    );
  }
}