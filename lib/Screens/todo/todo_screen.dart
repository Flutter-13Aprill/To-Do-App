import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/todo/edit_options.dart';
import 'package:getit/CustomWidgets/todo/todo_screen_tile.dart';
import 'package:getit/Models/category.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.category, required this.todoId});
  final String todoId;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return BlocListener<IndexBloc, IndexState>(
      listener: (listenercontext, state) {
        if (state is TodoDeleted) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<IndexBloc, IndexState>(
        builder: (context, state) {
          var bloc = context.read<IndexBloc>();
          ToDoModel todo = bloc.supabase.todosList.firstWhere(
            (todo) => todo.id == todoId,
          );

          DateTime parsedDate = bloc.fullDateTime;
          final now = DateTime.now();

          String dueDate = "";
          if (parsedDate.year == now.year &&
              parsedDate.month == now.month &&
              parsedDate.day == now.day) {
            // “Today at HH:mm”
            dueDate = 'Today at ${DateFormat.Hm().format(parsedDate)}';
          } else {
            // “dd/MM/yyyy”  (or e.g. “MMM d, yyyy”)
            dueDate = DateFormat('dd/MM/yyyy').format(parsedDate);
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                bloc.add(PopTaskscreen(context));
                              },
                              icon: Icon(Icons.close, color: mainText),
                              style: IconButton.styleFrom(
                                backgroundColor: containerColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.repeat, color: mainText),
                              style: IconButton.styleFrom(
                                backgroundColor: containerColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocProvider.value(
                        value: bloc,
                        child: TodoScreenTile(todo: todo, category: category),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.6,
                        child: BlocProvider.value(
                          value: bloc,
                          child: EditOptions(
                            todo: todo,
                            category: category,
                            dueDate: dueDate,
                          ),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
