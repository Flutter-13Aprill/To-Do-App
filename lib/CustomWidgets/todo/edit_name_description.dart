// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class EditNameDescription extends StatelessWidget {
  const EditNameDescription({super.key, required this.todo});
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<IndexBloc>();
    bloc.todoNameController.text = todo.task;
    bloc.todoDescriptionController.text = todo.description;
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();

        return AlertDialog(
          backgroundColor: containerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: context.keyboardPadding),
              child: Container(
                height: context.screenHeight * 0.25,
                decoration: BoxDecoration(color: containerColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: bloc.editFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.tr(
                                "TaskSheet.todoNameValidationError",
                              );
                            }
                            return null;
                          },
                          controller: bloc.todoNameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: borderColor,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hint: Text(
                              context.tr("TaskSheet.taskNamePlaceholder"),
                              style: TextStyle(color: mainText),
                            ),
                          ),
                          onChanged: (value) {
                            todo.task = value;
                            bloc.add(RefreshScreen(context));
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.tr(
                                "TaskSheet.todoDescriptionValidationError",
                              );
                            }
                            return null;
                          },
                          controller: bloc.todoDescriptionController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: borderColor,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hint: Text(
                              context.tr(
                                "TaskSheet.taskDescriptionPlaceholder",
                              ),
                              style: TextStyle(color: mainText),
                            ),
                          ),
                          onChanged: (value) {
                            todo.description = value;
                            bloc.add(RefreshScreen(context));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                bloc.todoNameController.text = todo.task;
                                bloc.todoDescriptionController.text =
                                    todo.description;
                                Navigator.pop(context);
                                bloc.add(RefreshScreen(context));
                              },
                              child: Text(
                                context.tr("TaskSheet.cancelButton"),
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (bloc.editFormKey.currentState!.validate()) {
                                  bloc.add(RefreshScreen(context));

                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                context.tr("TaskScreen.editTaskButton"),
                                style: TextStyle(color: mainText),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
