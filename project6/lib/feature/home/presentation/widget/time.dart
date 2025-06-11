import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class Time extends StatelessWidget {
  const Time({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return TimePickerSpinner(
          is24HourMode: false,
          normalTextStyle: TextStyles.lato40016.copyWith(color: Colors.grey),
          highlightedTextStyle: TextStyles.lato40016.copyWith(
            color: Colors.white,
          ),
          spacing: 30,
          itemHeight: 50,
          isForce2Digits: true,
          onTimeChange: (time) {
            bloc.add(GetTimeEvent(time: time));
          },
        );
      },
    );
  }
}
