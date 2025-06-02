import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/material.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/presentation/widget/time.dart';

class Calendar {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final nowDate = DateTime.now();
    DateTime? selectedDate;
    return showCupertinoCalendarPicker(
      context,
      widgetRenderBox: renderBox,
      minimumDateTime: nowDate.subtract(const Duration(days: 15)),
      initialDateTime: nowDate,
      maximumDateTime: nowDate.add(const Duration(days: 360)),
      timeLabel: 'Ends',
      mainColor: AppPalette.lightPurple,
      headerDecoration: CalendarHeaderDecoration(
        monthDateStyle: TextStyles.lato40016,
        forwardButtonColor: AppPalette.whiteColor,
        backwardButtonColor: AppPalette.whiteColor,
        backwardDisabledButtonColor: AppPalette.lightPurple,
        forwardDisabledButtonColor: AppPalette.lightPurple,
      ),
      containerDecoration: PickerContainerDecoration(
        backgroundColor: AppPalette.lightBlack2,
        borderRadius: BorderRadius.circular(12),
      ),
      weekdayDecoration: CalendarWeekdayDecoration(
        textStyle: TextStyles.lato40012,
      ),
      monthPickerDecoration: CalendarMonthPickerDecoration(
        defaultDayStyle: CalendarMonthPickerDefaultDayStyle(
          textStyle: TextStyles.lato40012,
        ),
        currentDayStyle: CalendarMonthPickerCurrentDayStyle(
          textStyle: TextStyles.lato40012,
        ),

        disabledDayStyle: CalendarMonthPickerDisabledDayStyle(
          textStyle: TextStyles.lato40012.copyWith(
            color: AppPalette.lightGray2,
          ),
        ),
      ),

      actions: [
        CancelCupertinoCalendarAction(
          label: AppText.cancel,

          decoration: CalendarActionDecoration(
            labelStyle: TextStyles.lato40016.copyWith(
              color: AppPalette.purpleColor,
            ),
            pressedColor: AppPalette.purpleColor,
          ),

          onPressed: () {
            // context.customPop();
          },
        ),
        ConfirmCupertinoCalendarAction(
          label: AppText.time,
          isDefaultAction: true,
          decoration: CalendarActionDecoration(
            labelStyle: TextStyles.lato40016.copyWith(
              color: AppPalette.whiteColor,
            ),
            pressedColor: AppPalette.purpleColor,
          ),
          onPressed: (dateTime) {
            Navigator.of(context).pop(); 
            Future.microtask(() {
              Time.onCalendarWidgetTap(context);
            });
          },
        ),
      ],
    );
  }
}
