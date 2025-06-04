import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class WeekView extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;

  const WeekView({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Week starting from Sunday
    final startOfWeek = selectedDate.subtract(Duration(days: selectedDate.weekday % 7));
    final days = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return Container(
      color: const Color(0xFF2C2C2C),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days.map((day) {
          final isSelected = day.day == selectedDate.day &&
              day.month == selectedDate.month &&
              day.year == selectedDate.year;

          return GestureDetector(
            onTap: () => onDateSelected(day),
            child: Container(
              width: 48,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF8687E7) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    _getDayLabel(day.weekday).tr(), 
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getDayLabel(int weekday) {
    switch (weekday % 7) {
      case 0:
        return 'sun';
      case 1:
        return 'mon';
      case 2:
        return 'tue';
      case 3:
        return 'wed';
      case 4:
        return 'thu';
      case 5:
        return 'fri';
      case 6:
      default:
        return 'sat';
    }
  }
}
