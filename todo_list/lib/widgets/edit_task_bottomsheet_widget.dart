import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:todo_list/models/task/task_model.dart';
import 'package:todo_list/screens/bottomnav/bottom_nav_screen.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/delete_dialog_widget.dart';

class EditTaskBottomsheetWidget extends StatelessWidget {
  final TaskModel task;

  const EditTaskBottomsheetWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();
    return BlocListener<IndexBloc, IndexState>(
      listener: (context, state) {
        if (state is TaskSavedState) {
          Navigator.of(context).pop();
          context.read<IndexBloc>().add(FetchTasksEvent());

          Navigator.of(context).pop();
        } else if (state is ErrorState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Faield')));
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            color: AppColors.backgroundColor,
            height: context.getHeight(factor: 0.95),
            width: context.getWidth(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.almostBlack,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.close, size: 20),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.almostBlack,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.repeat, size: 20),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h16,

                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_circle_outline
                            : Icons.circle_outlined,
                        color: AppColors.whiteTransparent,
                      ),

                      onPressed: () {},
                    ),
                    title: Text(task.title),
                    subtitle: Text(task.description!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined),
                    ),
                    contentPadding: EdgeInsets.all(8),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: AppColors.whiteTransparent,
                          ),
                          AppSpacing.w16,

                          Text(
                            "Task Time :",
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                        onPressed: () {},
                        child: Text(
                          (task.datetime != null)
                              ? bloc.formatDateTimeHumanFriendly(
                                context,
                                task.datetime,
                              )
                              : "date",
                          style: TextStyle(color: AppColors.whiteTransparent),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            LucideIcons.tag,
                            color: AppColors.whiteTransparent,
                          ),
                          AppSpacing.w16,

                          Text(
                            "Task Category :",
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              bloc.categoryIcons[bloc.categories[task
                                  .categoryId!]],
                              size: 18,
                              color: bloc.iconColors[task.categoryId!],
                            ),
                            SizedBox(width: 4),
                            Text(
                              "${bloc.categories[task.categoryId!]}",
                              style: TextStyle(
                                color: AppColors.whiteTransparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag_outlined,
                            color: AppColors.whiteTransparent,
                          ),
                          AppSpacing.w16,

                          Text(
                            "Task Priority :",
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.flag_outlined),
                            SizedBox(width: 4),
                            Text(
                              '${task.priority}',
                              style: TextStyle(
                                color: AppColors.whiteTransparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.sitemap,
                            color: AppColors.whiteTransparent,
                          ),
                          AppSpacing.w16,

                          Text(
                            "Sub - Task",
                            style: TextStyle(color: AppColors.whiteTransparent),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                        onPressed: () {},

                        child: Text(
                          "Add Sub - Task".tr(),
                          style: TextStyle(color: AppColors.whiteTransparent),
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h24,
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: DeleteDialogWidget(task: task),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        AppSpacing.w16,

                        Text(
                          "Delete Task",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      minimumSize: Size(
                        context.getWidth(factor: 0.9),
                        context.getHeight(factor: 0.055),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Task".tr().toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  AppSpacing.h24,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
