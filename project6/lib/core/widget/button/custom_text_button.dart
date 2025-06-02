import 'package:flutter/material.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.styles,
  });
  final void Function() onPressed;
  final String text;
  final TextStyle? styles;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:
            styles ?? TextStyles.lato40016.copyWith(color: AppPalette.white44),
      ),
    );
  }
}
