import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/screens/auth/auth_services.dart';
import 'package:todoapp_darkmode/screens/auth/login/bloc/login_bloc.dart';

import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// GET AUTH SERVICE
final authService  = AuthServices();

final _emailController  = TextEditingController();

final _passwordController  = TextEditingController();

void login() async {
final email  =  _emailController.text;
final password =  _passwordController.text;

try {
  await authService.signInWithEmailPassword(email, password);
}
catch (e){
  if (mounted){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error: $e")));
  }
}
}

   @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is LoginSuccess) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, '/home');
        }

        if (state is! LoginLoading && Navigator.canPop(context)) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },





    
    child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(children: [
        SizedBox(height: 150,),
        Row(
          children: [
            SizedBox(width: 30,),
            Text("Login", style: AppFonts.fontSizeTwo),
          ],
        ),
            SizedBox(height: 40,),
        Row(
          children: [
                  SizedBox(width: 30,),
            Text("Username",style: AppFonts.fontSizeThree),
          ],
        ),
        SizedBox(height:16,),
        SizedBox(
          width: 380,
          height: 68,
          child: Builder(
            builder: (context) {
              return TextFormField(
                 controller: _emailController, 
               
                style: AppFonts.fontSizeThree,

                decoration: InputDecoration(
                 hintText: 'Enter your Username',
               hintStyle: AppFonts.fontSizeThree,
                  filled: true,
                  fillColor: AppColors.darkgrey,
                     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
              color: AppColors.lightgrey,
              width: 0.8,
                    ),
                ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                color: AppColors.lightgrey,
              width: 0.8,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
              color: AppColors.lightgrey,
              width: 0.8,
                    ),
                  ),
              ),
              );
            }
          ),
        ),
          SizedBox(height: 32,),
        Row(
          children: [
             SizedBox(width: 30,),
            Text("Password", style: AppFonts.fontSizeThree),
          ],
        ),
        SizedBox(height:16,),
          SizedBox(
          width: 380,
          height: 68,
          child: Builder(
            builder: (context) {
              return TextFormField(
               controller: _passwordController, 
             obscureText: true,
              style: AppFonts.fontSizeThree.copyWith(color: Colors.white),
              
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
               hintStyle: AppFonts.fontSizeThree,
                  filled: true,
                  fillColor: AppColors.darkgrey,
                     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
              color: AppColors.lightgrey,
              width: 0.8,
                    ),
                ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                color: AppColors.lightgrey,
              width: 0.8,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
              color: AppColors.lightgrey,
              width: 0.8,
                    ),
                  ),
              ),
              );
            }
          ),
          
        ),
        ElevatedButton(
           onPressed: () {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Email and password can’t be empty.")),
    );
    return;
  }

  context.read<LoginBloc>().add(LoginSubmitted(email, password));
},

                      style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.lilac,
              foregroundColor: Colors.white,
               minimumSize: Size(380, 48), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), 
                  ),
                  padding: EdgeInsets.zero,
                      ),
                      child: Text("Login",style: AppFonts.fontSizeTen),
                      ),
        SizedBox(height: 150,),
         Row(
           children: [
            SizedBox(width: 115,),
             Text("Don't have an account?", style: AppFonts.fontSizeFour),
                         SizedBox(width:5,),
             GestureDetector(
              onTap: (){},
              child: Text("Registor", style: AppFonts.fontSizeThree)),
           ],
         ),
         
      ],)
    )
    );
    
  }
}