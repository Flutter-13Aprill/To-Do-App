import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/style/app_colors.dart';

class TimelineCalendar extends StatelessWidget {
  const TimelineCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff363636),
      height: 111,
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 24),
              Icon(Icons.arrow_back_ios_rounded, color: AppColors.white),
              Column(
                children: [
                  Text(
                    "June",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                  ),
                  Text(
                    "2025",
                    style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffAFAFAF),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined, color: AppColors.white),
              SizedBox(width: 24),
            ],
          ),
          SizedBox(height: 9),

          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {},
            headerProps: const EasyHeaderProps(
              showHeader: false,
              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: const EasyDayProps(
              todayStyle: DayStyle(
                decoration: BoxDecoration(color: AppColors.dark),
                dayNumStyle: TextStyle(color: Colors.white),
                dayStrStyle: TextStyle(fontSize: 12, color: Colors.red),
              ),
              inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(color: AppColors.dark),
                dayNumStyle: TextStyle(color: Colors.white),
                dayStrStyle: TextStyle(fontSize: 12, color: AppColors.white),
              ),
              dayStructure: DayStructure.dayStrDayNum,
              height: 52,
              width: 48,

              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
