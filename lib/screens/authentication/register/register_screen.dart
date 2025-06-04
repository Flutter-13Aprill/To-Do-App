import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/authentication/login/login_screen.dart';
import 'package:to_do_list/screens/authentication/register/bloc/register_bloc.dart';
import 'package:to_do_list/screens/home/index/index.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RegisterBloc>();
          bloc.registerFormKey;
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  Form(
                    key: bloc.registerFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: .6,
                                  ),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  controller: bloc.usernameController,
                                  decoration: InputDecoration(
                                    hintText: "  Enter your Username",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a valid entry";
                                    } else if (value.length < 2) {
                                      return "Name must atleast be 3 character";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: .6,
                                  ),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  obscureText: true,
                                  controller: bloc.passwordController,
                                  decoration: InputDecoration(
                                    hintText: "...........",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a valid entry";
                                    } else if (value.length < 5) {
                                      return "Password must atleast be 6 character long";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),

                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Confirm Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: .6,
                                  ),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  controller: bloc.confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "  ...........",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a valid entry";
                                    } else if (value !=
                                        bloc.passwordController.text) {
                                      return "The passwords aren't the same";
                                    } else if (value ==
                                        bloc.passwordController.text) {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is SuccefullRegisterState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndexScreen(),
                          ),
                        );
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        if (bloc.registerFormKey.currentState!.validate()) {
                          bloc.add(NewRegisterEvent());
                        } else {
                          print("Validation Failed");
                        }
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text("Register"),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "  Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
