import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/screens/calendar/calendar_screen.dart';
import 'package:project6/screens/home/home_screen.dart';
import 'package:project6/screens/profile_screen.dart';
import 'package:project6/widgets/bottom_nav/bloc/bottom_bloc.dart';

class BottomNavHandler extends StatelessWidget {
  const BottomNavHandler({super.key,});


  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomeScreen(),CalendarScreen(),ProfileScreen()];
    return BlocProvider(
      create: (context) => BottomBloc(),

      child: BlocBuilder<BottomBloc, BottomState>(
        builder: (context, state) {
          final bloc = context.read<BottomBloc>();
          return Scaffold(
            body: pages[bloc.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => {bloc.add(ChangePage(value: value))},
              currentIndex: bloc.currentIndex,
              backgroundColor: Color.fromARGB(255, 54, 54, 54),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon:
                      bloc.currentIndex == 0
                          ? Image.asset('assets/icons/home_select.png')
                          : Image.asset('assets/icons/home.png'),
                  label: 'home'.tr(),
                ),
                BottomNavigationBarItem(
                  icon:
                      bloc.currentIndex == 1
                          ? Image.asset('assets/icons/calendar_select.png')
                          : Image.asset('assets/icons/calendar.png'),
                  label: 'calendar'.tr(),
                ),
                BottomNavigationBarItem(
                  icon:
                      bloc.currentIndex == 2
                          ? Icon(Icons.person)
                          : Icon(Icons.person_outline),
                  label: 'profile'.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
