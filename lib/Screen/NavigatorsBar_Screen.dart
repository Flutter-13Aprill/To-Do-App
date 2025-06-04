import 'package:flutter/material.dart';
import 'package:to_do_app_development/Screen/Calendar_Screen.dart';
import 'package:to_do_app_development/Screen/Profile_Screen.dart';
<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart'; 
import 'index_screen.dart';
class NavigatorsBarScreen extends StatelessWidget {
  NavigatorsBarScreen({super.key});
=======


import 'index_screen.dart';

class NavigatorsBarScreen extends StatelessWidget {
  NavigatorsBarScreen({super.key});

>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _pages = [IndexScreen() ,CalendarScreen(),ProfileScreen() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return _pages[currentIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return BottomNavigationBar(
            backgroundColor: const Color(0xFF363636),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            currentIndex: currentIndex,
            onTap: (index) {
              _currentIndexNotifier.value = index;
            },
<<<<<<< HEAD
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: tr('index'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: tr('calendar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: tr('profile'),
=======
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Index',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
              ),
            ],
          );
        },
      ),
    );
  }
}