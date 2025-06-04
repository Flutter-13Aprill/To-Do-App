import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/calendar/bloc/calendar_bloc.dart';
// import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/theme/app_colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final bloc = context.read<CalendarBloc>();

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('calendar'.tr(), style: context.titleM()),
              ),
              body: Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 107.h,
                      color: AppColors().alertBackgroundColor,
                      child: Center(
                        child: EasyDateTimeLine(
                          dayProps: EasyDayProps(
                            inactiveDayStyle: DayStyle(
                              dayNumStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              dayStrStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromARGB(255, 39, 39, 39),
                              ),
                            ),
                            activeDayStyle: DayStyle(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors().buttonColor,
                              ),
                            ),
                            dayStructure: DayStructure.dayStrDayNum,
                            width: 39.w,
                            height: 48.h,
                          ),
                          headerProps: EasyHeaderProps(
                            monthPickerType: MonthPickerType.switcher,
                            centerHeader: true,
                          ),
                          initialDate: DateTime.now(),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),

                    Container(
                      width: 326.w,
                      height: 80.h,
                      color: AppColors().alertBackgroundColor,
                      child: TabBar(
                        labelColor: Colors.white,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.white,
                        onTap: (value) {
                          bloc.add(ChangTabEvent(tabIndex: value));
                        },
                        tabs: [
                          Tab(
                            child: Container(
                              width: 137.w,
                              height: 49.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    bloc.currentIndex == 0
                                        ? AppColors().buttonColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: bloc.currentIndex == 0
                                        ? Colors.transparent
                                        : Colors.white,),
                              ),
                              child: Text('today').tr(),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 137.w,
                              height: 49.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    bloc.currentIndex == 1
                                        ? AppColors().buttonColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color:
                                    bloc.currentIndex == 1
                                        ? Colors.transparent
                                        : Colors.white,),
                              ),
                              child: Text('complete').tr(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
