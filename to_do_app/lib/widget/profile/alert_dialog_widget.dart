import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screen/profile/bloc/profile_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return AlertDialog(
      backgroundColor: AppColors.darkGrey,
      content: Container(
        height: 220,
        child: Column(
          children: [
            Text(
              "Change account name",
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ).tr(),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 16),

            TextField(
              controller: bloc.textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a new name".tr(),
              ),
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:
                        Text(
                          "Cancel",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ).tr(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(ChnageName());
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.primary,
                    ),
                    child: Text("Edit", style: AppTextStyles.subText).tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
