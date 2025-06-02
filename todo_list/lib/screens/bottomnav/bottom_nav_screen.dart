import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/bottomnav/bloc/bottomnav_bloc.dart';
import 'package:todo_list/style/app_colors.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BottomnavBloc>();
          return BlocBuilder<BottomnavBloc, BottomnavState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: WidgetStatePropertyAll(
                      TextStyle(color: AppColors.whiteTransparent),
                    ),
                  ),
                  child: NavigationBar(
                    backgroundColor: AppColors.darkGray,
                    selectedIndex: bloc.selectIndex,
                    onDestinationSelected: (value) {
                      bloc.add(NavSelectionEvent(index: value));
                    },
                    indicatorColor: Colors.transparent,

                    destinations: [
                      NavigationDestination(
                        label: "index".tr(),
                        icon: Icon(
                          Icons.home_outlined,
                          color: AppColors.whiteTransparent,
                        ),
                        selectedIcon: Icon(
                          Icons.home,
                          color: AppColors.whiteTransparent,
                        ),
                      ),
                      NavigationDestination(
                        label: "calendar".tr(),
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.whiteTransparent,
                        ),
                        selectedIcon: Icon(
                          Icons.calendar_month,
                          color: AppColors.whiteTransparent,
                        ),
                      ),
                      NavigationDestination(
                        label: "profile".tr(),
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: AppColors.whiteTransparent,
                        ),
                        selectedIcon: Icon(
                          Icons.person,
                          color: AppColors.whiteTransparent,
                        ),
                      ),
                    ],
                  ),
                ),
                body: bloc.screens[bloc.selectIndex],
              );
            },
          );
        },
      ),
    );
  }
}
