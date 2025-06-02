import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';

import 'bloc/add_task_bloc.dart';

void showCalendarPicker(BuildContext parentContext) {
  DateTime tempMonth = DateTime.now();
  int? tempSelectedDay;

  showDialog(
    context: parentContext,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: BlocProvider.of<AddTaskBloc>(parentContext),
        child: Builder(
          builder: (newContext) => AlertDialog(
            backgroundColor: AppColors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(16),
            content: StatefulBuilder(
              builder: (context, setModalState) {
                final year = tempMonth.year;
                final month = tempMonth.month;
                final days = DateUtils.getDaysInMonth(year, month);
                final firstWeekday = DateTime(year, month, 1).weekday % 7;
                final totalCells = ((firstWeekday + days) / 7).ceil() * 7;

                List<Widget> dayBoxes = [];
                for (int i = 0; i < totalCells; i++) {
                  final dayNum = i - firstWeekday + 1;
                  final showBox = dayNum > 0 && dayNum <= days;

                  dayBoxes.add(
                    GestureDetector(
                      onTap: showBox
                          ? () => setModalState(() => tempSelectedDay = dayNum)
                          : null,
                      child: _dateBox(dayNum, tempSelectedDay == dayNum, showBox),
                    ),
                  );
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () => setModalState(() {
                            tempMonth = DateTime(tempMonth.year, tempMonth.month - 1);
                          }),
                        ),
                        Column(
                          children: [
                            Text(_monthName(month), style: const TextStyle(color: Colors.white)),
                            Text("$year", style: const TextStyle(color: Colors.white70)),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                          onPressed: () => setModalState(() {
                            tempMonth = DateTime(tempMonth.year, tempMonth.month + 1);
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(height: 1, color: Colors.white),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SUN", style: TextStyle(color: Colors.red)),
                        Text("MON", style: TextStyle(color: Colors.white)),
                        Text("TUE", style: TextStyle(color: Colors.white)),
                        Text("WED", style: TextStyle(color: Colors.white)),
                        Text("THU", style: TextStyle(color: Colors.white)),
                        Text("FRI", style: TextStyle(color: Colors.white)),
                        Text("SAT", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(spacing: 12, runSpacing: 10, children: dayBoxes),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 16),
                  ElevatedButton(
onPressed: () {
  if (tempSelectedDay != null) {
    final selectedDate = DateTime(
      tempMonth.year,
      tempMonth.month,
      tempSelectedDay!,
    );

    print("Date picked: $selectedDate"); //DEBUG HERE

    newContext.read<AddTaskBloc>().add(DatePicked(selectedDate));

    Navigator.pop(dialogContext);
    showTimePickerDialog(parentContext); //opens time picker after
  }
},


  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.lilac,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  child: const Text("Choose Time"),
),

                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}



Widget _dateBox(int number, bool isSelected, bool showBox) {
  return Container(
    width: 24,
    height: 24,
    alignment: Alignment.center,
    decoration: showBox
        ? BoxDecoration(
            color: isSelected ? AppColors.lilac : AppColors.darkgrey,
            borderRadius: BorderRadius.circular(4),
          )
        : null,
    child: Text(
      "$number",
      style: TextStyle(
        color: showBox ? Colors.white : Colors.transparent,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

String _monthName(int month) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  return months[month - 1];
}


/// time picker 
void showTimePickerDialog(BuildContext outerContext) {
  int selectedHour = 8;
  int selectedMinute = 0;
  String selectedPeriod = 'AM';

  showDialog(
    context: outerContext,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: AppColors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(16),
        content: StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Choose Time", style: AppFonts.fontSizeThree),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _timeBox(
                      "${selectedHour.toString().padLeft(2, '0')}",
                      () => setModalState(() {
                        selectedHour = (selectedHour + 1) % 13;
                        if (selectedHour == 0) selectedHour = 1;
                      }),
                    ),
                    const SizedBox(width: 8),
                    const Text(":", style: TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(width: 8),
                    _timeBox(
                      "${selectedMinute.toString().padLeft(2, '0')}",
                      () => setModalState(() {
                        selectedMinute = (selectedMinute + 1) % 60;
                      }),
                    ),
                    const SizedBox(width: 8),
                    _timeBox(
                      selectedPeriod,
                      () => setModalState(() {
                        selectedPeriod = selectedPeriod == 'AM' ? 'PM' : 'AM';
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final time = TimeOfDay(
                      hour: selectedPeriod == 'AM'
                          ? selectedHour % 12
                          : (selectedHour % 12) + 12,
                      minute: selectedMinute,
                    );

                    //  Use outerContext instead of dialog context
                    outerContext.read<AddTaskBloc>().add(TimePicked(time));
                    Navigator.pop(outerContext);
                    print("Time picked: ${time.format(outerContext)}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lilac,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text("Save"),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}



Widget _timeBox(String value, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 64,
      height: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
    ),
  );
}