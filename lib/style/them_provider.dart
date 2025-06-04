// lib/provider/theme_provider.dart

import 'package:flutter/material.dart';
import 'package:to_do_app_development/style/them.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? ThemeData.dark() : AppTheme.lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
