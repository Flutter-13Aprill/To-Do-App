import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CustomCalendar extends StatefulWidget {
  final void Function(DateTime) onDateSelected;
  CustomCalendar({super.key, required this.onDateSelected});

  @override
  State<CustomCalendar> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CustomCalendar> {
  List<DateTime?> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF363636),
      ),

      // // backgroundColor: Color(0xFF363636),
      // appBar: AppBar(backgroundColor: Colors.black),
      // body:
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CalendarDatePicker2WithActionButtons(
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.range,
            selectedDayHighlightColor: Colors.deepPurple,
            selectedDayTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            dayTextStyle: const TextStyle(color: Colors.white),
            weekdayLabelTextStyle: const TextStyle(color: Colors.white70),
            disabledDayTextStyle: const TextStyle(color: Colors.grey),
            yearTextStyle: const TextStyle(color: Colors.white),

            okButton: TextButton(
              onPressed: () {
                if (selectedDates.isNotEmpty && selectedDates.first != null) {
                  widget.onDateSelected(selectedDates.first!);
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 136, 117, 255),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text("Choose Time", style: TextStyle(color: Colors.white)),
            ),
            // okButton: Container(
            //   color: Color.fromARGB(255, 136, 117, 255),

            //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //   child: Text("Choose Time", style: TextStyle(color: Colors.white)),
            // ),
            cancelButton: Text(
              "Cancel ",
              style: TextStyle(color: Color.fromARGB(255, 136, 117, 255)),
            ),
          ),

          value: selectedDates,
          onValueChanged: (dates) {
            setState(() {
              selectedDates = dates;
            });
          },
        ),
      ),
    );
  }
}
