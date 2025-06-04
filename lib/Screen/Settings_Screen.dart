import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app_development/Screen/NavigatorsBar_Screen.dart';
import 'package:to_do_app_development/style/them_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showLanguageDialog(BuildContext context) {
    final theme = Theme.of(context);
    final isDark =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor:
                isDark ? Colors.grey[900] : theme.dialogBackgroundColor,
            title: Text(
              'change_app_language'.tr(),
              style: TextStyle(
                color: isDark ? Colors.white : theme.textTheme.bodyLarge?.color,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'english'.tr(),
                    style: TextStyle(
                      color:
                          isDark
                              ? Colors.white
                              : theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  onTap: () {
                    context.setLocale(const Locale('en'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'arabic'.tr(),
                    style: TextStyle(
                      color:
                          isDark
                              ? Colors.white
                              : theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  onTap: () {
                    context.setLocale(const Locale('ar'));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final theme = Theme.of(context);

    // Use dark hardcoded colors if dark mode, else use theme colors
    final scaffoldBgColor =
        isDark ? Colors.black : theme.scaffoldBackgroundColor;
    final iconColor =
        isDark ? Colors.white : theme.iconTheme.color ?? Colors.black;
    final textColor =
        isDark
            ? Colors.white
            : theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: iconColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigatorsBarScreen()),
            );
          },
        ),
        title: Text(
          'settings'.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
=======
import 'package:to_do_app_development/Screen/NavigatorsBar_Screen.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  NavigatorsBarScreen()),
            );
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
<<<<<<< HEAD
              alignment:
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? Alignment.topRight
                      : Alignment.topLeft,
              child: Text(
                'settings'.tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
=======
              alignment: Alignment.topLeft,
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
<<<<<<< HEAD
              leading: Icon(Icons.color_lens, color: iconColor),
              title: Text(
                'change_app_color'.tr(),
                style: TextStyle(color: textColor),
              ),
              trailing: Switch(
                value: isDark,
                activeColor: Colors.white,
                onChanged: (_) => themeProvider.toggleTheme(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: iconColor),
              title: Text(
                'change_app_language'.tr(),
                style: TextStyle(color: textColor),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: iconColor),
              onTap: () => _showLanguageDialog(context),
=======
              leading: const Icon(Icons.color_lens, color: Colors.white),
              title: const Text(
                'Change app color',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onTap: () {
                // Handle app color change
              },
            ),

            ListTile(
              leading: const Icon(Icons.language, color: Colors.white),
              title: const Text(
                'Change app language',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onTap: () {
                // Handle language change
              },
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
            ),
          ],
        ),
      ),
    );
  }
}
