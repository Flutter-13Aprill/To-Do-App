import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:intl/intl.dart';

class DateTimeLine extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? function;

  const DateTimeLine({super.key, this.selectedDate, this.function});

  @override
  State<DateTimeLine> createState() => _DateTimeLineState();
}

class _DateTimeLineState extends State<DateTimeLine> {
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker.itemBuilder(
      firstDate: DateTime(2025, 5, 1),
      lastDate: DateTime(2025, 8, 1),
      focusedDate: widget.selectedDate,
      itemExtent: 72.0,
      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        final day = DateFormat('d').format(date); // اليوم (مثلاً 3)
        final month = DateFormat('MMM').format(date); // الشهر (مثلاً Jun)

        return InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppPalette.purble : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? AppPalette.purble : Colors.grey.shade400,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppPalette.purble.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  month,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onDateChange: (date) {
        widget.function?.call(date);
      },
    );
  }
}
