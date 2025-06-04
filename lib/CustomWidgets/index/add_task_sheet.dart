import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/index/categories/categories_grid.dart';
import 'package:getit/CustomWidgets/shared/add_dialog_calendar.dart';
import 'package:getit/CustomWidgets/shared/priority_dialog.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: context.keyboardPadding),
            child: Container(
              height: context.screenHeight * 0.25,
              decoration: BoxDecoration(color: containerColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: bloc.addFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              bloc.fullDateTime == DateTime.now() ||
                              bloc.selectedPriority == -1 ||
                              bloc.selectedCategory!.name == "Default") {
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
                        onChanged: (value) {},
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
                            context.tr("TaskSheet.taskDescriptionPlaceholder"),
                            style: TextStyle(color: mainText),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: AddDialogCalendar(),
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/timer.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: CategoriesGrid(),
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/tag.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: PriorityDialog(),
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset(
                                  "assets/images/flag.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              if (bloc.addFormKey.currentState!.validate()) {
                                bloc.add(AddTodo());
                                Navigator.pop(context);
                              }
                            },
                            icon: Image.asset(
                              "assets/images/send.png",
                              height: 25,
                              width: 25,
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
        );
      },
    );
  }
}
