import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/repo/supabase.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/button/purple_button.dart';

class TaskScreen extends StatelessWidget {
  final int id;
  final String task;
  final String desciption;

  final String day;
  final String month;
  final String year;
  final int priority;
  final bool isDone;
  const TaskScreen({
    super.key,
    required this.id,
    required this.task,
    required this.desciption,

    required this.day,
    required this.month,
    required this.year,
    required this.priority,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 32,
                    height: 32,
                    color: AppColors.dark,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "X",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    color: AppColors.dark,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.repeat_sharp,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Checkbox(
                value: isDone,
                onChanged: (value) {},
                shape: CircleBorder(),
                side: BorderSide(color: AppColors.white),
              ),
              title: Text(task, style: AppTextStyles.headerText),
              subtitle: Text(desciption, style: AppTextStyles.settingSubText),
              trailing: Icon(
                Icons.mode_edit_outlined,
                color: AppColors.whiteOpacity,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 20,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.access_time_rounded,
                      color: AppColors.white,
                    ),
                    title:
                        Text("Task Time :", style: AppTextStyles.subText).tr(),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "$day/$month/$year ",
                        style: AppTextStyles.smallText,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.tag_outlined, color: AppColors.white),
                    title:
                        Text(
                          "Task Category :",
                          style: AppTextStyles.subText,
                        ).tr(),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("none", style: AppTextStyles.smallText),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flag_outlined, color: AppColors.white),
                    title:
                        Text(
                          "Task Priority :",
                          style: AppTextStyles.subText,
                        ).tr(),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("$priority", style: AppTextStyles.smallText),
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      SupabaseConnect.taskDelete(id: id);
                    },
                    leading: Icon(Icons.delete_outline, color: Colors.red),
                    title:
                        Text(
                          "Delete Task",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ).tr(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: PurpleButton(
                horizontal: 130,
                vertical: 12,
                name: "Edit Task",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
