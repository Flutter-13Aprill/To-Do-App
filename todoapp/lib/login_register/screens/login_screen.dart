import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/intro/Screens/onbording.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/login_register/bloc/log_in_bloc.dart';
import 'package:todoapp/login_register/widgets/textfild.dart';
import 'package:todoapp/navigation_button_bar/screens/nav.dart';
import 'package:todoapp/theems/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is Loginstateloding) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("loding..")));
          } else if (state is Loginsucsses) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Loginsucsses..")));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          } else if (state is Loginfaildstate) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Faild..")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: MyAppColor.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(color: MyAppColor.white),
                      ),
                    ),
                    Textfild(
                      hinttext: 'Enter your name',
                      controller: usernamecontroller,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(color: MyAppColor.white),
                      ),
                    ),
                    Textfild(
                      hinttext: '...........',
                      controller: passwordcontroller,
                      obscureText: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50),
                    NextButton(
                      button_text: 'Login',
                      onPressed: () {
                        print(usernamecontroller.text);
                        if (formkey.currentState!.validate()) {
                          context.read<LogInBloc>().add(
                            Login(
                              Password: passwordcontroller.text,
                              email: usernamecontroller.text+"@gmail.com",
                            ),
                          );
                        }
                      },
                      color: const Color.fromARGB(255, 93, 47, 173),
                      textColor: Colors.white,
                      width: 500,
                    ),
                    SizedBox(height: 40),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Already have an acount?  ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(text: 'Login'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
