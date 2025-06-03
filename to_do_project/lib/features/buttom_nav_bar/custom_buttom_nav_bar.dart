import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/features/buttom_nav_bar/bloc/navigation_bloc.dart';
import 'package:to_do_project/features/main_screen/Index/index_screen.dart';
import 'package:to_do_project/features/main_screen/calendar/calendar_screen.dart';
import 'package:to_do_project/features/main_screen/profile/profile_screen.dart';
import 'package:to_do_project/features/main_screen/Index/bloc/task_bloc.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    final screens = [
      BlocProvider.value(value: taskBloc, child: const IndexScreen()),
      const CalendarScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            backgroundColor: const Color(0xFF2D2D2D),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              context.read<NavigationBloc>().add(NavigationTabChanged(index));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Index'),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
