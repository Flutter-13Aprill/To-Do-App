import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant.dart';
import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/widget/custom_text_field.dart';
import 'package:to_do_app/features/auth/login/login_screen.dart';
import 'package:to_do_app/features/auth/registertion/bloc/registertion_bloc.dart';
import 'package:to_do_app/features/start/widgets/custom_button.dart';
import 'package:to_do_app/core/repo/supabase.dart';

class RegistertionScreen extends StatelessWidget {
  const RegistertionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registertionFormkey = GlobalKey<FormState>();
    final TextEditingController usernameRegistertionController =TextEditingController();
    final TextEditingController passwordRegistertionController =TextEditingController();
    final TextEditingController passwordConfrimRegistertionController =TextEditingController();
    return BlocProvider(
      create: (context) => RegistertionBloc(),
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
                      key: registertionFormkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Registertion',
                            style: TextStyle(
                              fontSize: context.getShortest(per: 1.1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
              
                          SizedBox(height: context.getShortest(per: 1)),
              
                          CustomTextField(
                            text: 'Enter your Username',
                            controllers: usernameRegistertionController,
                            labelText: 'Username',
                            textFontsize: context.getShortest(per: 0.5),
                            hintsize: context.getShortest(per: 0.35),
                            labelsize: context.getShortest(per: 0.45),
                            fillcolor: AppPalette.lightBlack,
                            borderColor: AppPalette.textColor,
                            textColor: AppPalette.textColor,
                            hintColor: AppPalette.lightGrey,
                            condition:usernameRegistertionCondition,
                             onchanged: (value) => usernameRegistertionOnChanged(value!, context, passwordRegistertionController,passwordConfrimRegistertionController, registertionFormkey),
                          ),
              
                          SizedBox(height: context.getShortest(per: 1)),
              
                          CustomTextField(
                            text: 'Enter your Password',
                            controllers: passwordRegistertionController,
                            labelText: 'Password',
                            textFontsize: context.getShortest(per: 0.5),
                            hintsize: context.getShortest(per: 0.35),
                            labelsize: context.getShortest(per: 0.45),
                            fillcolor: AppPalette.lightBlack,
                            borderColor: AppPalette.textColor,
                            textColor: AppPalette.textColor,
                            isobscure: true,
                            hintColor: AppPalette.lightGrey,
                            condition:passwordRegistertionCondtion,
                            onchanged: (value) => passwordRegistertionOnChanged(value!, context, usernameRegistertionController,passwordConfrimRegistertionController, registertionFormkey),
                   ),
               SizedBox(height: context.getShortest(per: 1)),
              
                          CustomTextField(
                            text: 'Enter your Confrim Password',
                            controllers: passwordConfrimRegistertionController,
                            labelText: 'Confrim Password',
                            textFontsize: context.getShortest(per: 0.5),
                            hintsize: context.getShortest(per: 0.35),
                            labelsize: context.getShortest(per: 0.45),
                            fillcolor: AppPalette.lightBlack,
                            borderColor: AppPalette.textColor,
                            textColor: AppPalette.textColor,
                            isobscure: true,
                            hintColor: AppPalette.lightGrey,
                            condition:(value) => passwordConfrimRegistertionCondtion(value!, passwordRegistertionController),
                            onchanged: (value) => passwordRegistertionOnChanged(value!, context, usernameRegistertionController,passwordRegistertionController, registertionFormkey),
                   ),
                          SizedBox(height: context.getShortest(per: 2)),
              
                          BlocBuilder<RegistertionBloc, RegistertionState>(
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
                                text: "SignUp",
                                fontSize: context.getShortest(per: 0.5),
                                
                                onTap: () async {
                                  if (registertionFormkey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();

                                    final username=usernameRegistertionController.text.trim();
                                    final password = passwordRegistertionController.text.trim();
                                    bool success = await SupabaseConnect.registrationUser(username: username, password: password);
                                    if (success) {
                                    await Future.delayed(Duration(milliseconds: 500));
                                    if (!context.mounted) return;
                                    context.replacement(LoginScreen());
                                    } else {
                                      if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Registration failed. Try again.')),
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
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                  text: " Login",
                                  style: TextStyle(fontWeight: FontWeight.bold,),
                                  recognizer:TapGestureRecognizer()..onTap = () {context.replacement(LoginScreen());},
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
      )
    );
  }
}
