import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class ChangeImageBottomsheetWidget extends StatelessWidget {
  const ChangeImageBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGray,
      height: context.getHeight(factor: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "change_account_image".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteTransparent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(thickness: 1, color: AppColors.mediumGray),
            AppSpacing.h16,

            TextButton(
              onPressed: () {},
              child: Text(
                "take_picture".tr(),
                style: TextStyle(color: AppColors.whiteTransparent),
              ),
            ),
            AppSpacing.h8,

            TextButton(
              onPressed: () {},
              child: Text(
                "import_from_gallery".tr(),
                style: TextStyle(color: AppColors.whiteTransparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
