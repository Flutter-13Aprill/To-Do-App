import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/profile/bloc/profile_bloc.dart';
import 'package:getit/Screens/settings/settings_screen.dart';
import 'package:getit/Styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define some reusable colors

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          var bloc = context.read<ProfileBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header: "Profile"
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          context.tr('ProfileScreen.title'),
                          style: TextStyle(
                            color: mainText,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Avatar and Name
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: borderColor,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/pfp.png", // Placeholder image
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bloc.supabase.getUserName(),
                      style: TextStyle(
                        color: mainText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Task Counters Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          // "10 Task left" Card
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: borderColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  (bloc.supabase.todosList.length -
                                              bloc.supabase.howManyTodosDone())
                                          .toString() +
                                      context.tr("ProfileScreen.tasksLeft"),
                                  style: TextStyle(
                                    color: mainText,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // "5 Task done" Card
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: borderColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  bloc.supabase.howManyTodosDone().toString() +
                                      context.tr(
                                        "ProfileScreen.tasksCompleted",
                                      ),
                                  style: TextStyle(
                                    color: mainText,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Settings Section Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            context.tr('ProfileScreen.settingsSection'),
                            style: TextStyle(
                              color: mainText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // "App Settings" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(Icons.settings, color: mainText),
                        title: Text(
                          context.tr('ProfileScreen.settingsTile'),
                          style: TextStyle(color: mainText, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: mainText,
                          size: 16,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: SettingsScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Account Section Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            context.tr('ProfileScreen.accountSection'),
                            style: TextStyle(
                              color: mainText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // "Change account name" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(Icons.person, color: mainText),
                        title: Text(
                          context.tr('ProfileScreen.changeAccountNameTile'),
                          style: TextStyle(color: mainText, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: mainText,
                          size: 16,
                        ),
                        onTap: () {},
                      ),
                    ),

                    Divider(color: borderColor, height: 1),

                    // "Change account Image" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(Icons.camera_alt, color: mainText),
                        title: Text(
                          context.tr('ProfileScreen.changeAccountImageTile'),
                          style: TextStyle(color: mainText, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: mainText,
                          size: 16,
                        ),
                        onTap: () {},
                      ),
                    ),

                    Divider(color: borderColor, height: 1),

                    // "Log out" ListTile (red)
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          context.tr('ProfileScreen.logOutTile'),
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        onTap: () {},
                      ),
                    ),

                    // Fill remaining space so BottomNavigationBar is at bottom
                    const Spacer(),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
          );
        },
      ),
    );
  }
}
