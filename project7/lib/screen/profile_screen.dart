import 'dart:ffi';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Image.asset("assets/images/user.png"),
          Center(
            child: Text("Fahad", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 30),

          Row(
            children: [
              SizedBox(width: 14),
              Stack(
                children: [
                  Text("10 Task left"),
                  Container(height: 58, width: 153, color: Color(0xFF363636)),
                ],
              ),
              SizedBox(width: 80),
              Container(height: 58, width: 153, color: Color(0xFF363636)),
            ],
          ),
        ],
      ),
    );
  }
}
