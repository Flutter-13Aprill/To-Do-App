import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Text("Settings", style: AppTextStyles.headerText).tr(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(Icons.palette_outlined, color: AppColors.white),
            title: Text("Change app color", style: AppTextStyles.subText).tr(),
          ),
          ListTile(
            onTap: () {
              if (context.locale.languageCode == "ar") {
                context.setLocale(Locale("en", "US"));
              } else {
                context.setLocale(Locale("ar", "AR"));
              }
            },
            leading: Icon(Icons.g_translate_outlined, color: AppColors.white),
            title:
                Text("Change app language", style: AppTextStyles.subText).tr(),
          ),
        ],
      ),
    );
  }
}
