import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/index/widgets/date_widget/time_dialog.dart';

class CalendarContent extends StatelessWidget {
  final Function(DateTime) onDateTimeSelected;

  const CalendarContent({super.key, required this.onDateTimeSelected});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: const Color(0xFF2D2D2D),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Theme(
  data: Theme.of(context).copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurpleAccent, 
      onPrimary: Colors.white,          
      surface: Color(0xFF2D2D2D),       
      onSurface: Colors.white,         
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white), 
    ),
  ),
                  child: CalendarDatePicker(
                    initialDate: state.selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    onDateChanged: (date) {
                      context.read<CalendarBloc>().add(CalendarDateChanged(date));
                    },
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
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedTime = await showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                        value: context.read<CalendarBloc>(), 
                        child: CustomTimePickerDialog(),
                              ),
                        );

                        if (selectedTime != null) {
                          if (!context.mounted) return;
                          context
                              .read<CalendarBloc>()
                              .add(CalendarTimeChanged(selectedTime));
                          if (!context.mounted) return;
                          final fullDateTime = context
                              .read<CalendarBloc>()
                              .state
                              .fullDateTime;

                          onDateTimeSelected(fullDateTime);
                          if (context.mounted) Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      child: Text("Choose Time",style:TextStyle(color: AppPalette.textColor)),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
