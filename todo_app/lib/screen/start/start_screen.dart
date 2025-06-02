import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screen/auth/login/login_screen.dart';
import 'package:todo_app/screen/auth/signup/signup_screen.dart';
import 'package:todo_app/screen/start/bloc/start_bloc.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_button.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_scond_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<StartBloc>();
          return BlocListener<StartBloc, StartState>(
            listener: (context, state) {
              if (state is NavigateToLoginState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } else if (state is NavigateToCreateAccountState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorsApp.secondary,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: ColorsApp.white),
                ),
              ),
              body: Column(
                children: [
                  CustomMainText(text: 'Welcome to UpTodo'),
                  SizedBox(height: 24),
                  CustomScondText(
                    textAlign: TextAlign.center,
                    text:
                        '''Please login to your account or create new account to continue''',
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: 327,

                    child: CustomButton(
                      text: 'LOGIN',
                      onPressed: () {
                        bloc.add(LoginPressedEvent());
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    width: 327,
                    child: CustomButton(
                      borderColor: ColorsApp.primary,
                      backgroundColor: ColorsApp.secondary,
                      text: 'CREATE ACCOUNT',
                      onPressed: () {
                        bloc.add(CreateAccountPressedEvent());
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
