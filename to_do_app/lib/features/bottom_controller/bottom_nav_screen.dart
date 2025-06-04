import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/bottom_controller/bloc/nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor: AppPalette.darkGrey,
    currentIndex: bloc.selectIndex,
    onTap: (value) {
      bloc.add(ChangeNavSelectEvent(index: value));
    },
    selectedItemColor: AppPalette.textColor, 
    unselectedItemColor: AppPalette.Grey, 
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "Index",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        label: "Calendar",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Profile",
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
