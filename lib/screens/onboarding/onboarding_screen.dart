import 'package:flutter/material.dart';
import 'package:to_do_list/screens/navigation/navigation_screen.dart';
import 'package:to_do_list/screens/onboarding/pages/page_1.dart';
import 'package:to_do_list/screens/onboarding/pages/page_2.dart';
import 'package:to_do_list/screens/onboarding/pages/page_3.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageViewContoller = PageController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavigationScreen()),
            );
          },
          child: Text("SKIP"),
        ),
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 48),
            Container(
              width: 280,
              height: 250,
              color: Colors.amber,
              child: PageView(
                controller: pageViewContoller,
                children: [PageView1(), PageView2(), PageView3()],
              ),
            ),
            SizedBox(height: 32), //Indicator PageView
            Text("Manage Your Tasks", style: TextStyle(color: Colors.white)),
            SizedBox(height: 8),
            Text(
              "You can easily manage all of your daily tasks in DoMe for free",
              style: TextStyle(color: Colors.white),
              softWrap: true,
              maxLines: 2,
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("BACK")),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    child: Text("NEXT", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
