import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart'; // Import StyleColor for button colors
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true, // New parameter: default to true
  });

  final String title;
  final Function() onPressed;
  final bool isEnabled; // New property to control state

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin adjusted to match the image spacing (from edge)
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 14), // No horizontal margin here
      width: context.getWidth() * 0.9, // Match Textfeild width
      height: context.getHeigth() * .08,
      color:isEnabled
              ? StyleColor.primaryPurpulColor // Full purple when enabled
              : StyleColor.primaryPurpulColor.withOpacity(0.4),
      child: ElevatedButton(
        // onPressed is null if not enabled, making the button unclickable
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          // Background color changes based on isEnabled
          backgroundColor: isEnabled
              ? StyleColor.primaryPurpulColor // Full purple when enabled
              : StyleColor.primaryPurpulColor.withOpacity(0.4), // Lighter purple when disabled
          foregroundColor: Colors.white, // Text color remains white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      ),
    );
  }
}