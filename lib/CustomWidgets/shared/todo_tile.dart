import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:intl/intl.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(todo.dueDate).toLocal();
    final now = DateTime.now();
    String subtitleText;

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
          ),
        );
      },
    );
  }
}
