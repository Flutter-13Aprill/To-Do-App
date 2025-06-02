import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getit/Styles/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mainText),
          onPressed: () {},
        ),
        title: Text(
          context.tr('SettingsScreen.title'),
          style: TextStyle(
            color: mainText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title: "Settings"
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                context.tr('SettingsScreen.title'),
                style: TextStyle(
                  color: mainText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // "Change app color" ListTile
            Container(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.brush, color: mainText),
                title: Text(
                  context.tr('SettingsScreen.appColorTile'),
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

            // "Change app language" ListTile
            Container(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(Icons.translate, color: mainText),
                title: Text(
                  context.tr('SettingsScreen.language'),
                  style: TextStyle(color: mainText, fontSize: 16),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: mainText,
                  size: 16,
                ),
                onTap: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('ar'));
                  } else {
                    context.setLocale(const Locale('en', "US"));
                  }
                  setState(() {});
                },
              ),
            ),

            // Fill remaining space to push content up
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
