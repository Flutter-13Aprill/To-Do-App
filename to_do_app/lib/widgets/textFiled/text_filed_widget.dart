import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/style/my_style.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    super.key,
    required this.validator,
    required this.hintText,
    required this.label,
    this.obscureText = false,
    this.onChange,
  });
  final Function? validator;
  final Function(String)? onChange;
  final String hintText;
  final String label;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: ThemeData().textTheme.bodyMedium),
        StyleApp.sizeH16,

        TextFormField(
          obscureText: obscureText,
          onChanged: onChange != null
              ? (value) {
                  onChange!(value);
                }
              : null,
          style: const TextStyle(
            fontSize: 16,
          ), 
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 16),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ), // Center vertically in 48px
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.success),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
          validator: validator != null ? (value) => validator!(value) : null,
        ),
      ],
    );
  }
}
