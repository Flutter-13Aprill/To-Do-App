import 'package:flutter/material.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class TaskTextfield extends StatelessWidget {
  const TaskTextfield({super.key,required this.hintText,required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 18,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.lato40018,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.textFieldBorderColor),
          borderRadius: BorderRadius.circular(2),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
      ),
    );
  }
}
