import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project7/screen/calendar_screen.dart';
import 'package:project7/screen/index_screen.dart';
import 'package:project7/screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;
  final List<Widget> pages = [
    const IndexScreen(),

    const CalendarScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF363636),
        selectedItemColor: Colors.white,

        unselectedItemColor: Color.fromARGB(255, 139, 140, 140),

        type: BottomNavigationBarType.fixed,

        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Index',
          ),

          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendar, size: 30),
            label: 'Calendar',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userLarge, size: 25),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
