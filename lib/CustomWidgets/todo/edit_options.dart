import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/todo/edit_dialog_calendar.dart';
import 'package:getit/CustomWidgets/todo/edit_priority_dialog.dart';
import 'package:getit/CustomWidgets/todo/todo_categories_grid.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class EditOptions extends StatelessWidget {
  const EditOptions({
    super.key,
    required this.dueDate,
    required this.category,
    required this.todo,
  });
  final String dueDate;
  final Category category;
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        var bloc = context.read<IndexBloc>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset("assets/images/timer.png", height: 32, width: 32),
                  SizedBox(width: 8),

                  Text(
                    context.tr("TaskScreen.taskTime"),
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  SizedBox(width: 8),

                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: EditDialogCalendar(todo: todo),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: containerColor,
                    ),

                    child: Text(dueDate, style: TextStyle(color: mainText)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset("assets/images/tag.png", height: 32, width: 32),
                  SizedBox(width: 8),

                  Text(
                    context.tr("TaskScreen.taskCategory"),
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  SizedBox(width: 8),

                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: TodoCategoriesGrid(todo: todo),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: containerColor,
                    ),
                    child: Row(
                      children: [
                        Icon(bloc.selectedCategory!.icon, color: mainText),
                        SizedBox(width: 4),
                        Text(
                          bloc.selectedCategory!.name,
                          style: TextStyle(color: mainText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset("assets/images/flag.png", height: 32, width: 32),

                  SizedBox(width: 8),

                  Text(
                    context.tr("TaskScreen.taskPriority"),
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: EditPriorityDialog(todo: todo),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: containerColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/flag.png",
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          (bloc.selectedPriority).toString(),
                          style: TextStyle(color: mainText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/subtask.png",
                    height: 32,
                    width: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    context.tr("TaskScreen.subTask"),
                    style: TextStyle(color: mainText, fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: containerColor,
                    ),
                    child: Text(
                      context.tr("TaskScreen.subTaskButton"),
                      style: TextStyle(color: mainText),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/delete.png",
                    height: 32,
                    width: 32,
                  ),
                  SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      bloc.add(DeleteTodo(todo, context));
                    },
                    child: Text(
                      context.tr("TaskScreen.deleteButton"),
                      style: TextStyle(color: errorColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.1,
              ),
              child: SizedBox(
                width: double.infinity,
                height: context.screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(EditTodo(context, todo));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    context.tr("TaskScreen.editTaskButton"),
                    style: TextStyle(color: mainText),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
