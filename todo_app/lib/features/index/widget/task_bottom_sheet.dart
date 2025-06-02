import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/index/bloc/index_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/index/widget/calendar_dialog.dart';
import 'package:todo_app/features/index/widget/category_dialog.dart';
import 'package:todo_app/features/index/widget/priority_dialog.dart';
import 'package:todo_app/features/index/widget/text_field_widget.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// A bottom sheet widget to add a new task with inputs for task name,
/// description, and options to pick date, category, and priority.
/// Uses [IndexBloc] to manage state and events.
class TaskBottomSheet extends StatelessWidget {
  const TaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Task', style: StyleText.latoBold20),
            TextFieldWidget(
              input: bloc.taskController,
              hintText: 'Enter your task',
            ),
            TextFieldWidget(
              input: bloc.descriptionController,
              hintText: "Description",
              lines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showCalendarDialog(context);
                      },
                      icon: Icon(Icons.timer_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        showCategoryDialog(context, bloc);
                      },
                      icon: Icon(Icons.local_offer_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        showPriorityDialog(context, bloc);
                      },
                      icon: Icon(Icons.flag_outlined),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    bloc.add(SaveDataEvent());
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: StyleColor.purple,
                    size: 50,
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
