import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/todo/edit_name_description.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class TodoScreenTile extends StatelessWidget {
  const TodoScreenTile({super.key, required this.todo, required this.category});
  final ToDoModel todo;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        var bloc = context.read<IndexBloc>();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            tileColor: Colors.transparent,
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
            title: Text(todo.task, style: TextStyle(color: mainText)),
            subtitle: Text(todo.description, style: TextStyle(color: mainText)),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: bloc,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: context.keyboardPadding,
                        ),
                        child: EditNameDescription(todo: todo),
                      ),
                    );
                  },
                );
              },
              icon: Image.asset(
                "assets/images/edit.png",
                height: 32,
                width: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}
