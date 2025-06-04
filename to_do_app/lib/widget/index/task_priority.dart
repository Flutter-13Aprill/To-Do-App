import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/index/bloc/index_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();
    return AlertDialog(
      backgroundColor: AppColors.darkGrey,
      content: Container(
        height: 400,
        child: Column(
          children: [
            Text("Task Priority", style: AppTextStyles.headerText).tr(),
            Divider(),
            SizedBox(height: 22),
            Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 1));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("1", style: AppTextStyles.subText),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 2));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("2", style: AppTextStyles.subText),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 3));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("3", style: AppTextStyles.subText),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 4));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("4", style: AppTextStyles.subText),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 5));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("5", style: AppTextStyles.subText),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(AddPriority(priority: 6));
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(7),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: AppColors.white,
                          size: 30,
                        ),
                        Text("6", style: AppTextStyles.subText),
                      ],
                    ),
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
