import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/authentication/register/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RegisterBloc>();
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text("Register"),

                  Form(
                    key: bloc.registerFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: bloc.usernameController,
                          decoration: InputDecoration(
                            label: Text("Username"),
                            hintText: "Enter your Username",
                          ),
                        ),
                        TextFormField(
                          controller: bloc.passwordController,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            hintText: "...........",
                          ),
                        ),
                        TextFormField(
                          controller: bloc.confirmPasswordController,
                          decoration: InputDecoration(
                            label: Text("Confrim Password"),
                            hintText: "...........",
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      bloc.add(NewRegisterEvent());
                    },
                    child: Container(child: Text("Register")),
                  ),
                  InkWell(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        children: [TextSpan(text: "Login")],
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
