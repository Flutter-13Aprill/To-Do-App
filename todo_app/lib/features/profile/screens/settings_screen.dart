import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/profile/widgets/language_button.dart';
import 'package:todo_app/features/profile/widgets/profile_tile_widget.dart';
import 'package:todo_app/style/style_text.dart';

/// SettingsScreen that displays the app's settings page.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("settings".tr(), style: StyleText.latoBold20)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 16,
            children: [
              Align(
                alignment:
                    context.locale.languageCode == 'en'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: Text("settings".tr(), style: StyleText.latoRegular16),
              ),
              ProfileTileWidget(
                title: "changeAppColor".tr(),
                icon: Icons.person,
                iconTrailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
                style: StyleText.latoRegular16,
                iconColor: Colors.white,
              ),
              ProfileTileWidget(
                title: "changeAppLanguage".tr(),
                icon: Icons.settings,
                iconTrailing: SizedBox(width: 70, child: LanguageButton()),
                style: StyleText.latoRegular16,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
