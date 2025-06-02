import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/screens/nav/bloc/bottom_nav_bloc.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BottomNavBloc>();
          return BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: NavigationBar(
                  selectedIndex: bloc.selectIndex,
                  onDestinationSelected: (value) {
                    bloc.add(ChangeNavSelectEvent(index: value));
                  },

                  destinations: [
                    NavigationDestination(
                      label: "Home",
                      icon: Icon(Icons.home),
                    ),
                    NavigationDestination(
                      label: "Calender",
                      icon: Icon(Icons.calendar_month),
                    ),
                    NavigationDestination(
                      label: "Profile",
                      icon: Icon(Icons.person_outline_sharp),
                    ),
                  ],
                ),
                body: bloc.destinations[bloc.selectIndex],
              );
            },
          );
        },
      ),
    );
  }
}
