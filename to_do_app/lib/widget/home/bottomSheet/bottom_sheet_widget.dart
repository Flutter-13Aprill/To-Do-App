import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/style/my_style.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/utils/getit/setup.dart';
import 'package:to_do_app/view/layout/bloc/layout_bloc.dart';
import 'package:to_do_app/widget/auth/text_filed_auth_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.calenderEvent,
    required this.tagEvent,
    required this.flagEvent,
  });

  final Function() calenderEvent;
  final Function() flagEvent;
  final Function() tagEvent;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> formContent = {"taskName": "", "description": ""};
    final formService = GetIt.I<FormService>();
    return Container(
      padding: const EdgeInsets.all(16),
      height: context.getHight(pre: 0.4),
      child: Column(
        children: [
          TextFiledAuthWidget(
            onChange: (p0) {
              formContent['taskName'] = p0;
            },
            validator: null,
            hintText: 'task',
            label: 'Add Task',
          ),
          TextFiledAuthWidget(
            onChange: (p0) {
              formContent['description'] = p0;
            },
            validator: null,
            hintText: 'description',
            label: '',
          ),
          StyleApp.sizeH16,
          SizedBox(
            width: context.getWight(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        List<DateTime> taskDate = await calenderEvent();
                       formService.taskDate=taskDate[0];
                      },
                      icon: Image.asset(
                        color: AppColors.textPrimary,
                        width: context.getWight(pre: 0.06),
                        "lib/assets/images/home/timer.png",
                      ),
                    ),
                    IconButton(
                      onPressed: tagEvent,
                      icon: Image.asset(
                        color: AppColors.textPrimary,
                        width: context.getWight(pre: 0.06),
                        "lib/assets/images/home/tag.png",
                      ),
                    ),
                    IconButton(
                      onPressed: flagEvent,
                      icon: Image.asset(
                        color: AppColors.textPrimary,
                        width: context.getWight(pre: 0.06),
                        "lib/assets/images/home/flag.png",
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    formService.taskName = formContent['taskName'];
                    formService.description =
                        formContent['description'];
                        context.read<LayoutBloc>().add(AddNewTask(task: formService.getTask()));
                    //  print("${formService.taskName} -${formService.description}- ${formService.category.name} -${formService.priority}");
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
