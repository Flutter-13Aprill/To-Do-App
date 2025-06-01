import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/style/my_style.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/view/layout/bloc/layout_bloc.dart';
import 'package:to_do_app/view/task/bloc/task_bloc.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Builder(
        builder: (context) {
          var taskBloc = context.read<TaskBloc>();

          return BlocBuilder<TaskBloc, TaskState>(
            buildWhen: (previous, current) {
                if (current is ChangeTaskStateSuccessfully ){
                return true;
              }else{
                return false;
              }
            },
            builder: (context, state) {
              return BlocBuilder<LayoutBloc, LayoutState>(
                buildWhen: (previous, current) {
                  if (current is AddTaskSuccessfully) {
                    return true;
                  } else {
                    return false;
                  }
                },

                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: context.getHight(pre: 0.6),
                        child: ListView.builder(
                          itemCount: taskBloc.getIt.tasks.length,
                          itemBuilder: (context, index) {
                            TaskModel task = taskBloc.getIt.tasks[index];

                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.border,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.all(8.0),
                              padding: EdgeInsets.all(16),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    shape: CircleBorder(),
                                    value: task.isDone,
                                    onChanged: (value) {
                                      taskBloc.add(
                                        ChangeTaskState(taskIndex: index),
                                      );
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.title,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                        ),
                                        Text(
                                          "Today At 18:20",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: context.getHight(pre: 0.04),
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(
                                      top: 8,
                                      left: 2,
                                      right: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: task.category.color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        task.category.icon,
                                        StyleApp.sizeW8,
                                        Text(
                                          task.category.name,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.deepPurple,
                                      ),
                                    ),
                                    width: context.getWight(pre: 0.1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.flag_outlined),
                                        Text("${task.priority}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
