import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Repo/todo_data.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';
import 'package:intl/intl.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(todo.dueDate).toLocal();
    final now = DateTime.now();
    String subtitleText;

    Category category = GetIt.I.get<TodoData>().categories.firstWhere(
      (cat) => cat.name == todo.category,
    );

    // Check if same calendar day
    if (parsedDate.year == now.year &&
        parsedDate.month == now.month &&
        parsedDate.day == now.day) {
      // “Today at HH:mm”
      subtitleText = 'Today at ${DateFormat.Hm().format(parsedDate)}';
    } else {
      // “dd/MM/yyyy”  (or e.g. “MMM d, yyyy”)
      subtitleText = DateFormat('dd/MM/yyyy').format(parsedDate);
    }
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        var bloc = context.read<IndexBloc>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            tileColor: containerColor,
            leading: Checkbox(
              shape: CircleBorder(side: BorderSide(color: mainText)),
              value: todo.isDone,
              onChanged: (value) {
                todo.isDone = value!; // Update the isDone property
                bloc.add(
                  TodoCheckButtonPressed(todo: todo),
                ); // Dispatch event to update status
              },
            ),
            title: Text(
              todo.task,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
                color: mainText,
              ),
            ),
            subtitle: Text(subtitleText, style: TextStyle(color: mainText)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: context.screenWidth * 0.07,
                  width: context.screenWidth * 0.21,
                  decoration: BoxDecoration(
                    color: category.backgroundColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category.icon, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        category.name,
                        style: TextStyle(color: mainText, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: context.screenWidth * 0.07,
                  width: context.screenWidth * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: primaryColor),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/flag.png",
                        height: 16,
                        width: 16,
                      ),
                      Text(
                        todo.priority.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
