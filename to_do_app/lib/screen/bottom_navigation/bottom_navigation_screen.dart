import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screen/bottom_navigation/bloc/nav_bloc.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<NavBloc>();

          return BlocBuilder<NavBloc, NavState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  unselectedLabelStyle: AppTextStyles.smallText,
                  unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.98),
                  selectedItemColor: Color.fromRGBO(255, 255, 255, 0.87),
                  iconSize: 25,

                  backgroundColor: Color(0xff363636),
                  currentIndex: bloc.selectIndex,
                  onTap: (value) {
                    bloc.add(ChangeNavSelectEvent(index: value));
                  },

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: "Index".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_outlined),
                      label: "Calendar".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: "Profile".tr(),
                    ),
                  ],
                ),
                body: bloc.listWidget[bloc.selectIndex],
              );
            },
          );
        },
      ),
    );
  }
}
