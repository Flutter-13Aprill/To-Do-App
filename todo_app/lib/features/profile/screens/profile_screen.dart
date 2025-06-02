import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/profile/screens/settings_screen.dart';
import 'package:todo_app/features/profile/widgets/profile_tile_widget.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// ProfileScreen displays user profile info and settings options.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr(), style: StyleText.latoBold20)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                CircleAvatar(backgroundColor: Colors.amber, radius: 50),
                Text('name', style: StyleText.latoBold16),
                Row(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 150,
                      color: StyleColor.grey,
                      child: Center(child: Text("Task left")),
                    ),
                    Container(
                      height: 70,
                      width: 150,
                      color: StyleColor.grey,
                      child: Center(child: Text("Task done")),
                    ),
                  ],
                ),
                Align(
                  alignment:
                      context.locale.languageCode == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  child: Text("settings".tr(), style: StyleText.latoRegular16),
                ),
                ProfileTileWidget(
                  title: "appSettings".tr(),
                  icon: Icons.settings,
                  iconTrailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  style: StyleText.latoRegular16,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                ),
                Align(
                  alignment:
                      context.locale.languageCode == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  child: Text("account".tr(), style: StyleText.latoRegular16),
                ),
                ProfileTileWidget(
                  title: "changeAccountName".tr(),
                  icon: Icons.person,
                  iconTrailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  style: StyleText.latoRegular16,
                  iconColor: Colors.white,
                ),
                ProfileTileWidget(
                  title: "changeAccountPassword".tr(),
                  icon: Icons.password,
                  iconTrailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  style: StyleText.latoRegular16,
                  iconColor: Colors.white,
                ),
                ProfileTileWidget(
                  title: "changeAccountImage".tr(),
                  icon: Icons.camera_alt,
                  iconTrailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  style: StyleText.latoRegular16,
                  iconColor: Colors.white,
                ),
                ProfileTileWidget(
                  title: "logout".tr(),
                  icon: Icons.logout,
                  style: StyleText.latoRegular16Error,
                  iconColor: StyleColor.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
