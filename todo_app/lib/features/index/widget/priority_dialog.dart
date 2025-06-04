import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/index/bloc/index_bloc.dart';
import 'package:todo_app/features/index/widget/buttons_widget.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// Shows a dialog allowing the user to select a task priority from 1 to 10.
showPriorityDialog(context, IndexBloc bloc) {
  showDialog(
    context: context,
    builder: (context) {
      int? selectedPriority;

      return Dialog(
        backgroundColor: StyleColor.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Text("taskPriority".tr(), style: StyleText.latoBold16),
                Divider(color: Colors.white),
                Expanded(
                  child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final num = index + 1;
                      final isPressed = selectedPriority == num;
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isPressed ? StyleColor.grey : StyleColor.purple,
                        ),
                        onPressed: () {
                          selectedPriority = num;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.flag_outlined, color: Colors.white),
                            Text(
                              num.toString(),
                              style: StyleText.latoRegular10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ButtonsWidget(
                  text: "save".tr(),
                  onPressedNext: () {
                    if (selectedPriority != null) {
                      bloc.priority = selectedPriority!;
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
