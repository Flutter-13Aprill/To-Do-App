import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/widget/custom_button.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showAddTaskBottomSheet(context);
      },
      backgroundColor: AppPalete.buttton,
      shape: const CircleBorder(),
      child: Icon(Icons.add, color: AppPalete.text),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        return Container(
          decoration: BoxDecoration(
            color: AppPalete.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Add New Task',
                      style: TextStyles.lato400s16.copyWith(
                        fontSize: 20,
                        color: AppPalete.text,
                      ),
                    ),
                  ),
                  const Gap(24),

                  TextField(
                    style: TextStyles.lato400s16.copyWith(
                      color: AppPalete.text,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Task Title',
                      labelStyle: TextStyles.lato400s16.copyWith(
                        color: AppPalete.text,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppPalete.text),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppPalete.text.withOpacity(0.4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppPalete.text),
                      ),
                    ),
                  ),
                  const Gap(16),

                  TextField(
                    maxLines: 3,
                    style: TextStyles.lato400s16.copyWith(
                      color: AppPalete.text,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Task Description',
                      labelStyle: TextStyles.lato400s16.copyWith(
                        color: AppPalete.text,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppPalete.text),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppPalete.text.withOpacity(0.4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppPalete.text),
                      ),
                    ),
                  ),
                  const Gap(24),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_today, color: AppPalete.text),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.access_time, color: AppPalete.text),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.flag, color: AppPalete.text),
                      ),
                    ],
                  ),

                  const Gap(16),

                  const Gap(16),

                  const Gap(32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElvatedButton(
                        press: () {
                          Navigator.pop(bottomSheetContext);
                        },
                        width: 100,
                        height: 50,
                        child: Text(
                          'Cancel',
                          style: TextStyles.lato400s16.copyWith(
                            color: AppPalete.text,
                          ),
                        ),
                      ),
                      const Gap(16),

                      CustomElvatedButton(
                        press: () {
                          Navigator.pop(bottomSheetContext);
                        },
                        width: 120,
                        height: 50,
                        child: Text(
                          'Add Task',
                          style: TextStyles.lato400s16.copyWith(
                            color: AppPalete.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
