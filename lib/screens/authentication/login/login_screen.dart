import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Login"),
            Form(
              key: loginFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Username"),
                      hintText: "Enter your Username",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "...........",
                    ),
                  ),
                ],
              ),
            ),
            InkWell(child: Container(height: 48, child: Text("Login"))),
            InkWell(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  children: [TextSpan(text: "Register")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
