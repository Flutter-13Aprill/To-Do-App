import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getit/Screens/navbar/bloc/navbar_bloc.dart';
import 'package:getit/Styles/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          var bloc = context.read<NavbarBloc>();
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              backgroundColor: containerColor,
              indicatorColor: Colors.transparent,
              labelTextStyle: WidgetStatePropertyAll<TextStyle>(
                TextStyle(color: mainText),
              ),

              destinations: [
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.house, color: mainText),
                  label: context.tr("IndexScreen.tab"),
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.calendar, color: mainText),
                  label: context.tr("CalendarScreen.title"),
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.user, color: mainText),
                  label: context.tr("ProfileScreen.title"),
                ),
              ],
              selectedIndex: bloc.currentIndex,
              onDestinationSelected: (int index) {
                bloc.add(NavbarIndexChanged(index));
              },
            ),
            body: bloc.screens[bloc.currentIndex],
          );
        },
      ),
    );
  }
}
