import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/style_text.dart';

class ButtonsWidget extends StatelessWidget {
  /// A reusable widget displaying two buttons
  const ButtonsWidget({super.key, this.onPressedNext, required this.text});
  final Function()? onPressedNext;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel".tr(), style: StyleText.latoRegular16purple),
        ),
        ElevatedButton(
          onPressed: onPressedNext,
          child: Text(text, style: StyleText.latoRegular16),
        ),
      ],
    );
  }
}
