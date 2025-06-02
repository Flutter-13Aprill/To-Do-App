import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(fixedSize: Size(context.getWidth(multiplied: 0.9), context.getWidth(multiplied: 0.1))),
      child: Text(
        tr(label),
        style: TextStyles.lato40018,
      ),
    );
  }
}
