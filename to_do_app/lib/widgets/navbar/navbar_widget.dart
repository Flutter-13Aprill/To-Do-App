import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/views/layout/bloc/layout_bloc.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        context.read<LayoutBloc>().layoutIndex = index;
        print(index);
        context.read<LayoutBloc>().add(ChangePage(layoutIndex: index));
      },
      indicatorColor: AppColors.border,
      selectedIndex: context.read<LayoutBloc>().layoutIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon:
              //  Badge(child:
              Icon(Icons.date_range),
          //  ),
          label: 'Calendar',
        ),
        NavigationDestination(
          icon:
              // Badge(
              //   label: Text('2'),
              // child:
              Icon(Icons.person_outline_outlined),
          // ),
          label: 'Profile',
        ),
      ],
    );
  }
}
