import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/repo/supabase.dart';
import 'package:todo_list/screens/login/login_screen.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.darkGray,
      actionsPadding: EdgeInsets.all(8),
      title: Text(
        "log_out".tr(),
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteTransparent),
      ),
      content: SizedBox(
        width: context.getWidth(factor: 0.8),
        height: context.getHeight(factor: 0.10),
        child: Column(
          children: [
            Divider(thickness: 1, color: AppColors.mediumGray),
            SizedBox(height: 12),
            Text(
              "are_you_sure_logout".tr(),
              style: TextStyle(color: AppColors.whiteTransparent, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.getWidth(factor: 0.37),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "cancel".tr(),
                  style: TextStyle(color: AppColors.whiteTransparent),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(context.getWidth(factor: 0.37), 48),
              ),
              onPressed: () async {
                await SupabaseConnect.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                "log_out".tr(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
