import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.getWidth(), context.getHeight(multiplied: 0.05))
      ), 
      child: Text(label, style: TextStyles.lato40018,),
    );
  }
}