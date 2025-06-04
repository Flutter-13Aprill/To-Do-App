import 'package:flutter/material.dart';

/// A customizable time picker widget
class TimePickerWidget extends StatefulWidget {
  TimePickerWidget({super.key, required this.onTimeChanged});
  final Function(DateTime) onTimeChanged;
  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late int hour;
  late int minute;
  late String period;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    hour = now.hour > 12 ? now.hour - 12 : now.hour;
    minute = now.minute;
    period = now.hour >= 12 ? "PM" : "AM";
    final time = DateTime(0, 0, 0, hour, minute);
    widget.onTimeChanged(time);
  }

  void incrementHour() {
    setState(() {
      if (hour == 12) {
        hour = 1;
      } else {
        hour++;
      }
    });
  }

  void decrementHour() {
    setState(() {
      if (hour == 1) {
        hour = 12;
      } else {
        hour--;
      }
    });
  }

  void incrementMinute() {
    setState(() {
      if (minute == 59) {
        minute = 0;
        incrementHour();
      } else {
        minute++;
      }
    });
  }

  void decrementMinute() {
    setState(() {
      if (minute == 0) {
        minute = 59;
        decrementHour();
      } else {
        minute--;
      }
    });
  }

  void togglePeriod() {
    setState(() {
      period = period == "AM" ? "PM" : "AM";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: incrementHour,
                  icon: const Icon(Icons.expand_less_outlined, size: 40),
                ),
                Text(
                  hour.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: decrementHour,
                  icon: const Icon(Icons.expand_more_outlined, size: 40),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ":",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              children: [
                IconButton(
                  onPressed: incrementMinute,
                  icon: const Icon(Icons.expand_less_outlined, size: 40),
                ),
                Text(
                  minute.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: decrementMinute,
                  icon: const Icon(Icons.expand_more_outlined, size: 40),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  IconButton(
                    onPressed: togglePeriod,
                    icon: const Icon(Icons.expand_less_outlined, size: 40),
                  ),
                  Text(
                    period,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: togglePeriod,
                    icon: const Icon(Icons.expand_more_outlined, size: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period",
          style: const TextStyle(fontSize: 24, color: Colors.grey),
        ),
      ],
    );
  }
}
