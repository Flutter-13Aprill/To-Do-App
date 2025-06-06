import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/style/app_spacing.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/category_dialog_widget.dart';
import 'package:todo_list/widgets/date_dialog_widget.dart';
import 'package:todo_list/widgets/priority_dialog_widget.dart';
import 'package:todo_list/widgets/task_text_field_widget.dart';

class AddTaskBottomsheetWidget extends StatelessWidget {
  const AddTaskBottomsheetWidget({super.key});

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
            color: AppColors.darkGray,
            height: context.getHeight(factor: 0.34),
            width: context.getWidth(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "add_task".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.whiteTransparent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  AppSpacing.h16,

                  Form(
                    child: Column(
                      children: [
                        TaskTextFieldWidget(
                          controller: bloc.taskController,
                          hintText: "task_title".tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'task_required'.tr();
                            }
                            return null;
                          },
                        ),
                        AppSpacing.h16,

                        TaskTextFieldWidget(
                          controller: bloc.descController,
                          hintText: "description".tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'description_required'.tr();
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.h24,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider.value(
                                value: bloc,
                                child: DateDialogWidget(),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.timer_sharp,
                          color: AppColors.whiteTransparent,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider.value(
                                value: bloc,
                                child: CategoryDialogWidget(),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          LucideIcons.tag,
                          color: AppColors.whiteTransparent,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider.value(
                                value: bloc,
                                child: PriorityDialogWidget(),
                              );
                            },
                          );
                        },

                        icon: Icon(
                          Icons.flag_outlined,
                          color: AppColors.whiteTransparent,
                        ),
                      ),

                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          final bloc = context.read<IndexBloc>();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          );

                          bloc.add(SaveDataEvent());
                        },
                        child: Icon(
                          Icons.send_outlined,
                          color: AppColors.lightPurole,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
