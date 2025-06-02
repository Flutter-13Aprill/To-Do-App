import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/text/text_style.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int hour;
  late int minute;
  late String period;

  @override
  void initState() {
    super.initState();

    _setInitialTime(widget.initialTime);
  }

  void _setInitialTime(TimeOfDay time) {
    hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    minute = time.minute;
    period = time.period == DayPeriod.am ? "AM" : "PM";
  }

  void incrementHour() {
    setState(() {
      if (hour == 12) {
        hour = 1;

        togglePeriod();
      } else {
        hour++;
      }
    });
  }

  void decrementHour() {
    setState(() {
      if (hour == 1) {
        hour = 12;

        togglePeriod();
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

  TimeOfDay _getCurrentTimeOfDay() {
    int currentHour = hour;
    if (period == "PM" && hour != 12) {
      currentHour += 12;
    } else if (period == "AM" && hour == 12) {
      currentHour = 0;
    }
    return TimeOfDay(hour: currentHour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppPalete.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Time',
            style: TextStyles.lato400s16.copyWith(
              fontSize: 20,
              color: AppPalete.text,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: incrementHour,
                    icon: Icon(
                      CupertinoIcons.chevron_up,
                      color: AppPalete.text,
                    ),
                  ),
                  Text(
                    hour.toString().padLeft(2, '0'),
                    style: TextStyles.lato400s16.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppPalete.text,
                    ),
                  ),
                  IconButton(
                    onPressed: decrementHour,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppPalete.text,
                    ),
                  ),
                ],
              ),
              // Separator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  ":",
                  style: TextStyles.lato400s16.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppPalete.text,
                  ),
                ),
              ),
              // Minute Selection
              Column(
                children: [
                  IconButton(
                    onPressed: incrementMinute,
                    icon: Icon(
                      CupertinoIcons.chevron_up,
                      color: AppPalete.text,
                    ),
                  ),
                  Text(
                    minute.toString().padLeft(2, '0'),
                    style: TextStyles.lato400s16.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppPalete.text,
                    ),
                  ),
                  IconButton(
                    onPressed: decrementMinute,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppPalete.text,
                    ),
                  ),
                ],
              ),
              // Period Selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: togglePeriod,
                      icon: Icon(
                        CupertinoIcons.chevron_up,
                        color: AppPalete.text,
                      ),
                    ),
                    Text(
                      period,
                      style: TextStyles.lato400s16.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppPalete.text,
                      ),
                    ),
                    IconButton(
                      onPressed: togglePeriod,
                      icon: Icon(
                        CupertinoIcons.chevron_down,
                        color: AppPalete.text,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              widget.onTimeSelected(_getCurrentTimeOfDay());
              Navigator.pop(context, _getCurrentTimeOfDay());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppPalete.buttton,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Done',
              style: TextStyles.lato400s16.copyWith(color: AppPalete.text),
            ),
          ),
        ],
      ),
    );
  }
}
