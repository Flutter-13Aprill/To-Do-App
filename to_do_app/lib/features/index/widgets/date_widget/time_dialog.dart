import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';

class CustomTimePickerDialog extends StatelessWidget {
  
  const CustomTimePickerDialog({super.key,});

   @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CalendarBloc>(context),
      child: Dialog(
        backgroundColor: const Color(0xFF2D2D2D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pick Time',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  final currentTime = DateTime(
                    0,
                    0,
                    0,
                    state.selectedTime.hour,
                    state.selectedTime.minute,
                  );

                  return TimePickerSpinner(
                    is24HourMode: false,
                    normalTextStyle: const TextStyle(fontSize: 18, color: Colors.grey),
                    highlightedTextStyle: const TextStyle(fontSize: 22, color: Colors.white),
                    spacing: 50,
                    itemHeight: 60,
                    isForce2Digits: true,
                    time: currentTime,
                    onTimeChange: (dateTime) {
                      final newTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                      context.read<CalendarBloc>().add(CalendarTimeChanged(newTime));
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final state = context.read<CalendarBloc>().state;
                  Navigator.of(context).pop(state.selectedTime);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
                child:  Text('Save',style: TextStyle(color: AppPalette.textColor),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
