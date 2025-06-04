import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/index/bloc/index_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/index/task_priority.dart';

class IndexBottomSheetWidget extends StatelessWidget {
  const IndexBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text("Add Task", style: AppTextStyles.headerText).tr(),
          SizedBox(height: 14),
          TextField(
            controller: bloc.taskController,
            style: AppTextStyles.smallText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task".tr(),
              hintStyle: AppTextStyles.smallText,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: bloc.desciptionController,
            style: AppTextStyles.smallText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Desciption".tr(),
              hintStyle: AppTextStyles.smallText,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2025),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) return;
                      bloc.add(
                        ChangeDate(newDate.day, newDate.month, newDate.year),
                      );
                    },
                    icon: Icon(Icons.timer_outlined, color: AppColors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tag_outlined, color: AppColors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => BlocProvider.value(
                              value: bloc,
                              child: TaskPriority(),
                            ),
                      );
                    },
                    icon: Icon(Icons.flag_outlined, color: AppColors.white),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  bloc.add(SendTask());

                  Navigator.pop(context);
                },
                icon: Icon(Icons.send_outlined, color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
