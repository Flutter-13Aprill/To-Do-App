import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/bottom_nav/logic/bloc/bottom_nav_bloc.dart';
import 'package:uptodo/features/calendar/presentation/calendar_screen.dart';
import 'package:uptodo/features/home/presentation/home_screen.dart';
import 'package:uptodo/features/profile/presentation/profile_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final List<Widget> screens = [HomeScreen(), CalendarScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Builder(
        builder: (context) {
          final bottomNavBloc = context.read<BottomNavBloc>();

          return BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: NavigationBar(
                  selectedIndex: bottomNavBloc.index,
                  onDestinationSelected: (value) {
                    bottomNavBloc.add(ChangingScreenEvent(index: value));
                  },
                  destinations: [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined, size: 25, color: Colors.grey,),
                      selectedIcon: Icon(Icons.home, size: 25, color: Colors.white,),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.calendar_today,size: 25, color: Colors.grey,),
                      selectedIcon: Icon(Icons.calendar_month,size: 25, color: Colors.white,),
                      label: 'Calendar',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_2_outlined,size: 25, color: Colors.grey,),
                      selectedIcon: Icon(Icons.person,size: 25, color: Colors.white),
                      label: 'Profile',
                    ),
                  ],
                ),
                body: screens.elementAt(bottomNavBloc.index),
              );
            },
          );
        },
      ),
    );
  }
}
