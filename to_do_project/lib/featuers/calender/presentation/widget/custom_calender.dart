import 'package:flutter/material.dart';

class DateTimePickerDialogButton extends StatelessWidget {
  final Function(DateTime) onDateTimeSelected;
  final String buttonText;

  const DateTimePickerDialogButton({
    super.key,
    required this.onDateTimeSelected,
    this.buttonText = "Time",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF9E85FF)),
      onPressed: () {
        _showDateTimeDialog(context, onDateTimeSelected);
      },
      child: Text(buttonText),
    );
  }

  void _showDateTimeDialog(
    BuildContext context,
    Function(DateTime) onDateTimeSelected,
  ) {
    DateTime selectedDate = DateTime.now();
    int selectedHour = 12;
    int selectedMinute = 0;
    String period = 'AM';
    bool isChoosingTime = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF2E2E2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: isChoosingTime
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(" ", style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSpinner<int>(
                                values: List.generate(12, (i) => i + 1),
                                selectedValue: selectedHour,
                                onSelected: (val) =>
                                    setState(() => selectedHour = val),
                              ),
                              const SizedBox(width: 10),
                              _buildSpinner<int>(
                                values: List.generate(60, (i) => i),
                                selectedValue: selectedMinute,
                                onSelected: (val) =>
                                    setState(() => selectedMinute = val),
                              ),
                              const SizedBox(width: 10),
                              _buildSpinner<String>(
                                values: ['AM', 'PM'],
                                selectedValue: period,
                                onSelected: (val) =>
                                    setState(() => period = val),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9E85FF),
                              ),
                              onPressed: () {
                                int hour24 = selectedHour % 12;
                                if (period == 'PM') hour24 += 12;
                                final selectedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  hour24,
                                  selectedMinute,
                                );
                                Navigator.pop(context);
                                onDateTimeSelected(selectedDateTime);
                              },
                              child: const Text("Save"),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CalendarDatePicker(
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          onDateChanged: (date) => selectedDate = date,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  setState(() => isChoosingTime = true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9E85FF),
                              ),
                              child: const Text(" "),
                            ),
                          ],
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }

  Widget _buildSpinner<T>({
    required List<T> values,
    required T selectedValue,
    required Function(T) onSelected,
  }) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) => onSelected(values[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final value = values[index];
            final isSelected = value == selectedValue;
            return Center(
              child: Text(
                value is int
                    ? value.toString().padLeft(2, '0')
                    : value.toString(),
                style: TextStyle(
                  fontSize: isSelected ? 22 : 18,
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          },
          childCount: values.length,
        ),
      ),
    );
  }
}
