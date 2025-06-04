import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:todo_app/style/style_color.dart';

class LanguageButton extends StatelessWidget {
  /// A toggle switch to change the app language between English and Arabic.
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      showOnOff: true,
      value:
          context.locale.languageCode ==
          'en', // Switch position based on current language
      activeText: "AR",
      activeIcon: Icon(Icons.language),
      inactiveText: "EN",
      inactiveIcon: Icon(Icons.language),
      activeColor: StyleColor.purple,
      inactiveColor: Colors.grey,
      // Switch between English and Arabic on toggle
      onToggle: (value) {
        context.setLocale(value ? Locale('en', 'US') : Locale('ar', 'AR'));
      },
    );
  }
}
