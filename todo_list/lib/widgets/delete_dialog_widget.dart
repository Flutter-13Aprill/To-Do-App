import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/task/task_model.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class DeleteDialogWidget extends StatelessWidget {
  final TaskModel task;

  const DeleteDialogWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppColors.darkGray,
        actionsPadding: EdgeInsets.all(8),

        title: Text(
          "delete_task".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.whiteTransparent),
        ),
        content: SizedBox(
          width: context.getWidth(factor: 0.8),
          height: context.getHeight(factor: 0.15),
          child: Column(
            children: [
              Divider(thickness: 1, color: AppColors.mediumGray),
              SizedBox(height: 12),
              Text(
                "Are You sure you want to delete this task?".tr(),
                style: TextStyle(
                  color: AppColors.whiteTransparent,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),

              Text(
                "${'Task title'.tr()} : ${task.title}",
                style: TextStyle(
                  color: AppColors.whiteTransparent,
                  fontSize: 16,
                ),
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
                    style: TextStyle(color: AppColors.lightPurole),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightPurole,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(context.getWidth(factor: 0.37), 48),
                ),
                onPressed: () {
                  bloc.add(DeleteTaskEvent(taskId: task.id!));
                  Navigator.pop(context); // dialog
                  Navigator.pop(context); // bottom sheet
                },
                child: Text(
                  "delete".tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
