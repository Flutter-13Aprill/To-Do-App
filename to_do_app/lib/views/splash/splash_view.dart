import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset(
                height: 180,
                width: 140,
                "lib/assets/splash/splash.png",
              
            ),
            Text("UpTodo", style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
