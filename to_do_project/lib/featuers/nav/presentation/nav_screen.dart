import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/featuers/nav/bloc/nav_bloc.dart';

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
                  backgroundColor: AppPalete.bottomNavColor,
                  selectedIndex: bloc.selectIndex,
                  onDestinationSelected: (value) {
                    bloc.add(chaneUi(index: value));
                  },

                  destinations: [
                    NavigationDestination(
                      label: "Index",
                      icon: Icon(Icons.home),
                    ),
                    NavigationDestination(
                      label: "Calendar",
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                    NavigationDestination(
                      label: "Profile",
                      icon: Icon(Icons.person_outline_sharp),
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
