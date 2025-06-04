import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/navigation/bloc/navigation_bloc.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<NavigationBloc>();
          return BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt_sharp),
                  ),
                  centerTitle: true,
                  title: Text("Index"),
                  actions: [Image.asset("assets/images/home/ProfilePic.png")],
                ),
                bottomNavigationBar: NavigationBar(
                  destinations: [
                    NavigationDestination(
                      icon: Icon(Icons.home_filled),
                      label: "Index",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.calendar_month),
                      label: "Calendar",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person),
                      label: "Profile",
                    ),
                  ],
                  selectedIndex: bloc.selectedIndex,
                  onDestinationSelected: (value) {
                    bloc.add(
                      DestinationsSelectedEvent(selectedDestination: value),
                    );
                  },
                ),
                body: bloc.navigationScreens[bloc.selectedIndex],
              );
            },
          );
        },
      ),
    );
  }
}
