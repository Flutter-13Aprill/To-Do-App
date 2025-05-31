import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class PriorityDialog extends StatelessWidget {
  PriorityDialog({super.key});
  var gridSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        var priorities = bloc.categories.priority;
        return AlertDialog(
          backgroundColor: containerColor,
          title: Column(
            children: [Text(context.tr("TaskScreen.taskPriority")), Divider()],
          ),
          content: SizedBox(
            height: context.screenHeight * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: context.screenHeight * 0.45,
                  width: context.screenWidth,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: priorities.length, // +1 for “Create New”
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: gridSpacing,
                      crossAxisSpacing: gridSpacing,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final priority = priorities[index];
                      return InkWell(
                        onTap: () {
                          bloc.add(SelectPriority(index));
                        },
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: bloc.selectedPriority == index
                                ? primaryColor
                                : dayColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.flag, color: mainText, size: 30),
                              const SizedBox(height: 8),
                              Text(
                                priority,
                                style: TextStyle(color: mainText, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        context.tr("TaskSheet.cancelButton"),
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      child: Text(
                        context.tr("TaskSheet.chooseTimeButton"),
                        style: TextStyle(color: mainText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
