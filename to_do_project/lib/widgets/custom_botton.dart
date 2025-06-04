import 'package:flutter/material.dart';
// import 'package:to_do_project/screens/login_and_regiter/login_screen.dart';
// import 'package:to_do_project/style/color_theme.dart';
import 'package:to_do_project/widgets/text_themes/body_medium.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, required this.color, this.border, required this.screen});
  final String text;
  final Color color;
  final Border? border;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => screen),
          (route) => false,
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 60.0,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(child: BodyMedium(text: text)),
      ),
    );
  }
}
