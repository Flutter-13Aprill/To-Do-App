// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:project7/screen/calendar_screen.dart';
// import 'package:project7/screen/index_screen.dart';
// import 'package:project7/screen/profile_screen.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int currentPage = 0;
//   final List<Widget> pages = [
//     const IndexScreen(),

//     const CalendarScreen(),
//     const ProfileScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentPage],

//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xFF363636),
//         selectedItemColor: Colors.white,

//         unselectedItemColor: Color.fromARGB(255, 139, 140, 140),

//         type: BottomNavigationBarType.fixed,

//         currentIndex: currentPage,
//         onTap: (value) {
//           setState(() {
//             currentPage = value;
//           });
//         },
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.home, size: 35),
//             label: 'Index',
//           ),

//           const BottomNavigationBarItem(
//             icon: FaIcon(FontAwesomeIcons.calendar, size: 30),
//             label: 'Calendar',
//           ),
//           const BottomNavigationBarItem(
//             icon: FaIcon(FontAwesomeIcons.userLarge, size: 25),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project7/screen/nav/bloc/nav_bar_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<NavBarBloc>();
          return BlocBuilder<NavBarBloc, NavBarState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    backgroundColor: const Color(0xFF363636),
                    indicatorColor: Colors.transparent,
                    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((
                      states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return const IconThemeData(color: Colors.white);
                      }
                      return const IconThemeData(
                        color: Color.fromARGB(255, 139, 140, 140),
                      );
                    }),
                    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                      states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return const TextStyle(color: Colors.white);
                      }
                      return const TextStyle(
                        color: Color.fromARGB(255, 139, 140, 140),
                      );
                    }),
                  ),

                  child: NavigationBar(
                    selectedIndex: bloc.selectIndex,
                    onDestinationSelected: (value) {
                      bloc.add(ChangeNavSelectEvent(index: value));
                    },
                    destinations: const [
                      NavigationDestination(
                        label: "Index",
                        icon: Icon(Icons.home),
                      ),
                      NavigationDestination(
                        label: "Calendar",
                        icon: FaIcon(FontAwesomeIcons.calendar),
                      ),
                      NavigationDestination(
                        label: "Profile",
                        icon: FaIcon(FontAwesomeIcons.userLarge),
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
