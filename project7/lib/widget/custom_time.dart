import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class CustomTime extends StatefulWidget {
  final void Function(DateTime) onTimeSelected;

  const CustomTime({super.key, required this.onTimeSelected});

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF363636),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Choose Time",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/images/Divider.png",
              width: 280,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Container(
              color: Color(0xFF363636),
              child: TimePickerSpinner(
                is24HourMode: false,

                normalTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                ),
                highlightedTextStyle: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),

                spacing: 30,
                itemHeight: 60,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                  widget.onTimeSelected(time);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Color(0xFF363636),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Color.fromARGB(255, 136, 117, 255)),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Color.fromARGB(255, 136, 117, 255),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
