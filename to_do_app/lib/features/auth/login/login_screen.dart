import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/constant.dart';
import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/widget/custom_text_field.dart';
import 'package:to_do_app/features/auth/login/bloc/login_bloc.dart';
import 'package:to_do_app/features/auth/registertion/registertion_screen.dart';
import 'package:to_do_app/features/bottom_controller/bottom_nav_screen.dart';
import 'package:to_do_app/features/start/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormkey = GlobalKey<FormState>();
    final TextEditingController usernameLoginController =TextEditingController();
    final TextEditingController passwordLoginController =TextEditingController();
    return BlocProvider(
      
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getShortest(per: 1),
                  vertical: context.getShortest(per: 1),
                ),
                child: Form(
                  key: loginFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: context.getShortest(per: 1.1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          
                      SizedBox(height: context.getShortest(per: 1)),
          
                      CustomTextField(
                        text: 'Enter your Username',
                        controllers: usernameLoginController,
                        labelText: 'Username',
                        textFontsize: context.getShortest(per: 0.5),
                        hintsize: context.getShortest(per: 0.35),
                        labelsize: context.getShortest(per: 0.45),
                        fillcolor: AppPalette.lightBlack,
                        borderColor: AppPalette.textColor,
                        textColor: AppPalette.textColor,
                        hintColor: AppPalette.lightGrey,
                        condition:usernameLoginCondition,
                         onchanged: (value) => usernameLoginOnChanged(value!, context, passwordLoginController, loginFormkey),
                      ),
          
                      SizedBox(height: context.getShortest(per: 1)),
          
                      CustomTextField(
                        text: 'Enter your Password',
                        controllers: passwordLoginController,
                        labelText: 'Password',
                        textFontsize: context.getShortest(per: 0.5),
                        hintsize: context.getShortest(per: 0.35),
                        labelsize: context.getShortest(per: 0.45),
                        fillcolor: AppPalette.lightBlack,
                        borderColor: AppPalette.textColor,
                        textColor: AppPalette.textColor,
                        isobscure: true,
                        hintColor: AppPalette.lightGrey,
                        condition:passwordLoginCondtion,
                        onchanged: (value) => passwordLoginOnChanged(value!, context, usernameLoginController, loginFormkey),
               ),
          
                      SizedBox(height: context.getShortest(per: 2)),
          
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                            Color buttonColor = AppPalette.darkPurble;
                            if (state is TrueState) {
                            buttonColor = state.buttonColor;
                            }else if(state is FalseState){
                              buttonColor = state.buttonColor;
                            }
                          return CustomButton(
                           buttonColor: buttonColor,
                            borderColor: AppPalette.darkPurble,
                            textColor: AppPalette.textColor,
                            text: "Login",
                            fontSize: context.getShortest(per: 0.5),
                           onTap: () async {
  if (loginFormkey.currentState!.validate()) {
    FocusScope.of(context).unfocus();

    final user = await SupabaseConnect.loginUser(
      username: usernameLoginController.text.trim(),
      password: passwordLoginController.text.trim(),
    );

    await Future.delayed(Duration(milliseconds: 500));

    if (!context.mounted) return;

    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', user['id'].toString()); // Ensure it's a string

      context.replacement(BottomNavScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect username or password')),
      );
    }
  }
},

                            fontWeight: FontWeight.normal,
                          );
                        },
                      ),
                            SizedBox(height: context.getShortest(per: 0.5)),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          children: [
                            TextSpan(
                              text: " Register",
                              style: TextStyle(fontWeight: FontWeight.bold,),
                              recognizer:TapGestureRecognizer()..onTap = () {context.replacement(RegistertionScreen());},
                            ),
                          ],
                        ),
                      ),
                    )

                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
