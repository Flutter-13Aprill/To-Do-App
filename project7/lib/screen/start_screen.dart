import 'package:flutter/material.dart';
import 'package:project7/screen/login_screen.dart';
import 'package:project7/screen/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ButtonWidget button = ButtonWidget();
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),

            DefaultTextStyle(
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text("Welcome to UpToDo"),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 16, color: Colors.white),

                child: Text(
                  style: TextStyle(fontSize: 16, color: Colors.white),

                  "Please login to your account or create\n new account to continue",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 480),
            Column(
              children: [
                SizedBox(
                  height: 48,
                  width: 350,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: Color.fromARGB(255, 136, 117, 255),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },

                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: 350,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),

                        side: BorderSide(
                          color: Color.fromARGB(255, 136, 117, 255),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(0, 135, 117, 255),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        color: const Color.fromARGB(60, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 200),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
