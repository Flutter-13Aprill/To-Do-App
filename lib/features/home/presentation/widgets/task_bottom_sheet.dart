import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';
import 'package:uptodo/features/home/logic/bloc/tasks_bloc.dart';
import 'package:uptodo/features/home/presentation/widgets/categories_dialog.dart';
import 'package:uptodo/features/home/presentation/widgets/priority_dialog.dart';
import 'package:uptodo/features/home/presentation/widgets/table_calendar_dialog.dart';
import 'package:uptodo/features/home/presentation/widgets/task_textfield.dart';

class TaskBottomSheet extends StatelessWidget {
  const TaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {

        final tasksBloc = context.read<TasksBloc>();
        
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            width: context.getWidth(),
            height: context.getHeight(multiplied: 0.34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: AppPalette.bottomSheetColor,
            ),
            child: Column(
              children: [
                EmptySpace.sizeH24,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tr('home_screen.bottom_sheet_headline'),
                    style: TextStyles.lato60024,
                  ),
                ),

                EmptySpace.sizeH16,

                TaskTextfield(
                  hintText: tr('home_screen.task_name'),
                  controller: tasksBloc.taskNameController,
                ),

                TaskTextfield(
                  hintText: tr('home_screen.description'),
                  controller: tasksBloc.taskDescriptionController,
                ),

                EmptySpace.sizeH24,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 32,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return BlocProvider.value(
                                  value: tasksBloc,
                                  child: TableCalendarDialog(),
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/visuals/home/svgs/timer.svg',
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CategoriesDialog(
                                  getCategory: (String value) {
                                    tasksBloc.taskCategory = value;
                                  },
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset('assets/visuals/home/svgs/tag.svg',),
                        ),

                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PriorityDialog(getPriority: (value){
                                  tasksBloc.taskPriority = value;
                                });
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/visuals/home/svgs/flag.svg',
                          ),
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: (){
                        final task = TaskModel(
                          userName: null, 
                          taskName: tasksBloc.taskNameController.text, 
                          categoryName: tasksBloc.taskCategory, 
                          deadLine: tasksBloc.selectedDate, 
                          priorityTask: tasksBloc.taskPriority, 
                          isCompleted: false
                        );

                        tasksBloc.add(AddTaskEvent(task: task));

                        context.pop();
                      },
                      child: SvgPicture.asset('assets/visuals/home/svgs/send.svg',),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
