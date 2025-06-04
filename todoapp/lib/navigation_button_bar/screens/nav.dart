import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/navigation_button_bar/bloc/nav_bloc.dart';
import 'package:todoapp/theems/colors.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

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
                bottomNavigationBar: NavigationBar(
                  backgroundColor: MyAppColor.gray,
                  selectedIndex: bloc.selectIndex,
                  onDestinationSelected: (value) {
                    bloc.add(ChangeNavSelectEvent(index: value));
                  },

                  destinations: [
                    NavigationDestination(
                      label: "index",
                      icon: Icon(Icons.home_filled),
                    ),
                    NavigationDestination(
                      label: "Calender",
                      icon: Icon(Icons.calendar_month_outlined),
                    ),

                    NavigationDestination(
                      label: "profile",
                      icon: Icon(Icons.person_outline_rounded),
                    ),
                  ],
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
