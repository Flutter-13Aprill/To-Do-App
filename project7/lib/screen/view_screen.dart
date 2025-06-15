import 'package:flutter/material.dart';
import 'package:project7/screen/intro1_screen.dart';
import 'package:project7/screen/intro2_screen.dart';
import 'package:project7/screen/intro3_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewScreen extends StatelessWidget {
  final PageController _controller = PageController();

  ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [Intro1Screen(), Intro2Screen(), Intro3Screen()],
          ),

          Positioned(
            bottom: 400,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.white,
                  dotHeight: 6,
                  dotWidth: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
