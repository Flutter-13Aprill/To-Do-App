import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Textfeild extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController? controller; // Added controller
  final String? Function(String?)? validator; // Added validator
  final void Function(String)? onChanged; // Added onChanged

  const Textfeild({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.controller, // Initialize controller
    this.validator, // Initialize validator
    this.onChanged, // Initialize onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin adjusted to match the image spacing (from edge)
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8), // No horizontal margin here, handled by LoginScreen padding
      width: context.getWidth() * .9, // Adjusted width to 90%
      // height: context.getHeigth() * .1, // Remove fixed height, let content dictate

      child: TextFormField(
        controller: controller, // Pass the controller to TextFormField
        obscureText: isPassword,
        keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.text,
        validator: validator, // Pass the validator to TextFormField
        onChanged: onChanged, // Pass the onChanged to TextFormField
        style: const TextStyle(color: Colors.white), // Color of typed text

        decoration: InputDecoration(
          hintText: hint.tr(),
          fillColor: const Color(0xFF1F1F1F), // Dark grey background from image
          filled: true, // Crucial to make fillColor work

          // Border styles as per the image
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Color(0xFF8E8E8E), // Grey border color
              width: 1, // Thin border
            ),
          ),
          focusedBorder: OutlineInputBorder( // Border when text field is focused
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: StyleColor.primaryPurpulColor, // Purple border on focus
              width: 1,
            ),
          ),
          enabledBorder:   OutlineInputBorder( // Border when text field is enabled but not focused
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFF8E8E8E), // Grey border
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder( // Red border for validation errors
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder( // Red border when error and focused
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5), // Light grey, semi-transparent hint text
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding if necessary
        ),
      ),
    );
  }
}