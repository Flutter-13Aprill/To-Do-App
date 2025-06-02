import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/widget/nav/bloc/nav_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

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
                body: bloc.pages[bloc.selectedPage],
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) {
                    bloc.add(ChangeNavSelectedEvent(index: value));
                  },
                  currentIndex: bloc.selectedPage,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: AppText.index,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_outlined),
                      label: AppText.calendar,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_sharp),
                      label: AppText.profile,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
