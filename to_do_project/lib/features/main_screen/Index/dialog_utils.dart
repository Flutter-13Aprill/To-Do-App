import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../Index/bloc/task_bloc.dart';
import '../Index/bloc/task_event.dart';

Future<void> showCustomDateDialog(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          dialogBackgroundColor: const Color(0xFF2E2E2E),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF8875FF),
            onPrimary: Colors.white,
            surface: Color(0xFF2E2E2E),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    await showCustomTimeDialog(context, pickedDate);
  }
}

Future<void> showCustomTimeDialog(BuildContext context, DateTime date) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          timePickerTheme: const TimePickerThemeData(
            backgroundColor: Color(0xFF2E2E2E),
            dialHandColor: Color(0xFF8875FF),
            hourMinuteTextColor: Colors.white,
            dialTextColor: Colors.white,
            entryModeIconColor: Color(0xFF8875FF),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF8875FF),
            onPrimary: Colors.white,
            surface: Color(0xFF2E2E2E),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedTime != null) {
    final DateTime fullDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    // Send to BLoC
    context.read<TaskBloc>().add(TaskDateChanged(fullDateTime));
    context.read<TaskBloc>().add(
      TaskTimeChanged(DateFormat('hh:mm a').format(fullDateTime)),
    );
  }
}

Future<void> showPriorityDialog(BuildContext context) async {
  int selectedPriority = 1;

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF2E2E2E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Text(
              "Task Priority",
              style: TextStyle(color: Colors.white),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final number = index + 1;
                  final isSelected = selectedPriority == number;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPriority = number;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF8875FF)
                            : const Color(0xFF1D1D1D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.flag_outlined, color: Colors.white),
                            Text(
                              "$number",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8875FF),
                  minimumSize: const Size(153, 48),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
