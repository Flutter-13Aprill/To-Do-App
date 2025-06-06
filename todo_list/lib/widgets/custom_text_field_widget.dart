import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          onChanged: onChanged,
          style: TextStyle(color: AppColors.whiteTransparent),

          decoration: InputDecoration(
            hintText: hintText.tr(),
            hintStyle: TextStyle(color: AppColors.lightGray),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mediumGray),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mediumGray),
            ),
            contentPadding: EdgeInsets.all(14),
          ),
        ),
      ],
    );
  }
}
