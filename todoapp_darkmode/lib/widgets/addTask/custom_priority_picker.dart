import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_state.dart';
import 'bloc/add_task_bloc.dart';

void showPriorityPickerDialog(
  BuildContext context,
  int currentPriority,
  Function(int) onSelected,
) {
  int tempSelected = currentPriority; //  Declare the variable

  showDialog(
    context: context,
    builder: (ctx) {
      return BlocProvider.value(
        value: BlocProvider.of<AddTaskBloc>(context),
        child: BlocBuilder<AddTaskBloc, AddTaskState>(
          builder: (context, state) {
            return AlertDialog(
              backgroundColor: AppColors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              content: SizedBox(
                width: 327,
                height: 338,
                child: Column(
                  children: [
                    Text("Task Priority", style: AppFonts.fontSizeThree),
                    const SizedBox(height: 16),
                    Container(height: 1, color: Colors.white),
                    const SizedBox(height: 16),

                    // Priority Grid
                    for (var i = 0; i < 10; i += 4)
                      Row(
                        children: List.generate(4, (j) {
                          final number = i + j + 1;
                          if (number > 10) return const SizedBox.shrink();
                          final isSelected = state.priority == number;
                          return Padding(
                            padding: const EdgeInsets.only(right: 11, bottom: 11),
                            child: GestureDetector(
                              onTap: () {
                                tempSelected = number;
                                context.read<AddTaskBloc>().add(PriorityPicked(number));
                                onSelected(number); // if needed outside
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.lilac : AppColors.darkgrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "lib/assets/images/homeImages/flag.png",
                                      width: 24,
                                      height: 24,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "$number",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                    const Spacer(),

                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AddTaskBloc>().add(PriorityPicked(tempSelected));
                              onSelected(tempSelected);
                              Navigator.pop(ctx);
                              print("Priority picked: $tempSelected");
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.lilac),
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}



