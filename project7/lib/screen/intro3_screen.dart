import 'package:flutter/material.dart';
import 'package:project7/screen/intro2_screen.dart';
import 'package:project7/screen/start_screen.dart';

class Intro3Screen extends StatelessWidget {
  const Intro3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 230),

          Image.asset("assets/images/intro3.png"),
          const SizedBox(height: 75),
          const Text(
            "Organize your tasks",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "You can easily manage all of your daily\ntasks in DoME for free",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(height: 160),
          Row(
            children: [
              SizedBox(width: 20),
              SizedBox(
                height: 48,
                width: 90,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Color.fromARGB(0, 135, 117, 255),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Intro2Screen()),
                    );
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: const Color.fromARGB(60, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 200),
              SizedBox(
                height: 48,
                width: 90,

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
                      MaterialPageRoute(builder: (context) => StartScreen()),
                    );
                  },

                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
