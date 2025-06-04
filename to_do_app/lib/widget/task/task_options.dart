import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class TaskOptions extends StatelessWidget {
  const TaskOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        spacing: 20,
        children: [
          ListTile(
            leading: Icon(Icons.access_time_rounded, color: AppColors.white),
            title: Text("Task Time :", style: AppTextStyles.subText),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("Today At 16:45", style: AppTextStyles.smallText),
            ),
          ),
          ListTile(
            leading: Icon(Icons.tag_outlined, color: AppColors.white),
            title: Text("Task Category :", style: AppTextStyles.subText),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("none", style: AppTextStyles.smallText),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flag_outlined, color: AppColors.white),
            title: Text("Task Priority :", style: AppTextStyles.subText),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("1", style: AppTextStyles.smallText),
            ),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(Icons.delete_outline, color: Colors.red),
            title: Text(
              "Delete Task",
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
