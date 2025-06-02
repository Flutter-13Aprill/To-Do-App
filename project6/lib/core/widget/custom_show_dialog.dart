import 'package:flutter/material.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_button.dart';

class CustomShowDialog {
  static Future<void> show(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
    required String title,
    required Widget content,
  }) async {
    await showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: AppPalette.lightBlack2,
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyles.lato70016,
          ),
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    context.customPop();
                  },
                  height: 48,
                  width: 153,
                  color: AppPalette.lightBlack2,
                  child: Text(
                    AppText.cancel,
                    style: TextStyles.lato40016.copyWith(
                      color: AppPalette.purpleColor,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                CustomButton(
                  onPressed: onPressed,
                  height: 48,
                  width: 153,
                  child: Text(text, style: TextStyles.lato40016),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
