import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/intro/Screens/onbording.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/login_register/bloc/log_in_bloc.dart';
import 'package:todoapp/login_register/screens/login_screen.dart';
import 'package:todoapp/login_register/widgets/textfild.dart';
import 'package:todoapp/navigation_button_bar/screens/nav.dart';
import 'package:todoapp/theems/colors.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is Regesterstateloding) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("loding..")));
          } else if (state is Regesterstatesucsses) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Regesterstatesucsses")));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (state is RegesterstateFaild) {
            
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
                          "Register",
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
                    SizedBox(height: 40),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "confirm password",
                        style: TextStyle(color: MyAppColor.white),
                      ),
                    ),
                    Textfild(
                      hinttext: '...........',
                      controller: confirmcontroller,
                      obscureText: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    NextButton(
                      button_text: 'Register',
                      onPressed: () {
                        print(usernamecontroller.text);
                        if (formkey.currentState!.validate()) {
                          if (passwordcontroller.text ==
                              confirmcontroller.text) {
                            context.read<LogInBloc>().add(
                              Regester(
                                email: usernamecontroller.text,
                                password: passwordcontroller.text,
                                conformPassword: confirmcontroller.text,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("password it's not same")),
                            );
                          }
                        }
                      },
                      color: const Color.fromARGB(255, 93, 47, 173),
                      textColor: Colors.white,
                      width: 500,
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: RichText(
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
