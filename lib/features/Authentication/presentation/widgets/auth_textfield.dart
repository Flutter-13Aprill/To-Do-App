import 'package:flutter/material.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({super.key,required this.label,required this.controller ,required this.onValidate, required this.onSubmit, required this.focusNode ,this.isPassword = false});
  final String label;
  final bool isPassword;
  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String value)? onSubmit;

  final String? Function(String? value)? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: AppPalette.primaryTextColor,
      cursorHeight: 12,
      obscureText: isPassword ? true : false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: AppPalette.filledTextFieldColor,
        filled: true,
        hintText: label,
        hintStyle: TextStyle(color: AppPalette.hintColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0x0f979797), width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0x0f979797), width: 1),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red[200]!, width: 1),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red[200]!, width: 1),
        ),
      ),
      validator: onValidate,
      onFieldSubmitted: onSubmit ,
    );
  }
}
