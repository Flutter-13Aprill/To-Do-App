import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),

      body: Column(
        children: [
          Text("Welcome to UpTodo"),
          Text(
            "Please login to your account or create new account to continue",
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 32,
            child: Text("LOGIN"),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 32,
            child: Text("CREATE ACCOUNT"),
          ),
        ],
      ),
    );
  }
}
