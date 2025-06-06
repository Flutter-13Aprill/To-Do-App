import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'time_dialog_widget.dart';

class DateDialogWidget extends StatelessWidget {
  const DateDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IndexBloc>();

    return AlertDialog(
      backgroundColor: AppColors.darkGray,
      content: SizedBox(
        height: 380,
        width: 320,
        child: BlocBuilder<IndexBloc, IndexState>(
          builder: (context, state) {
            final selectedDate = bloc.selectedDate;

            return SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: selectedDate,
              onSelectionChanged: (args) {
                if (args.value is DateTime) {
                  final date = args.value as DateTime;
                  bloc.add(DateSelectedEvent(date));
                }
              },
              headerHeight: 70,
              showNavigationArrow: true,
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: AppColors.darkGray,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              monthViewSettings: const DateRangePickerMonthViewSettings(
                dayFormat: 'EEE',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: const TextStyle(color: Colors.white),
                cellDecoration: BoxDecoration(
                  color: AppColors.ultraDarkGray,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              backgroundColor: AppColors.darkGray,
            );
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth(factor: 0.34),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "cancel".tr(),
                  style: const TextStyle(color: AppColors.lightPurole),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurole,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(context.getWidth(factor: 0.34), 48),
              ),
              onPressed: () {
                final selectedDate = bloc.selectedDate;
                if (selectedDate != null) {
                  bloc.add(DateSelectedEvent(selectedDate));
                }
                Navigator.of(context).pop();

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BlocProvider.value(
                      value: bloc,
                      child: const TimeDialogWidget(),
                    );
                  },
                );
              },
              child: Text(
                "choose_time".tr(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
