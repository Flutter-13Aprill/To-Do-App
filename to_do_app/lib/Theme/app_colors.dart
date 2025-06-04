import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
 // Primary Colors (Brand Colors)
  static const Color primary = Color(0xFF3B82F6); // Blue (Primary Action)
  static const Color primaryDark = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF93C5FD);
  static const Color deepPurple = Color.fromRGBO(112,97,255,1);

  // Secondary Colors
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color accent = Color(0xFFEC4899); // Pink (For alerts/CTA)

  // Background & Surface Colors
  static const Color background = Color(0xFFF9FAFB); // Light Gray BG
  static const Color surface = Color(0xFFFFFFFF); // White Cards
  static const Color surfaceDark = Color(0xFFF3F4F6); // Slightly darker surface
  static const Color surfaceDark2 = Color(0xFF1F2937); // Slightly darker surface
  static const Color primaryDarkDarkMode = Color(0xFF1E40AF); // Darker blue with less brightness
  static const Color deepPurpleDarkMode = Color(0xFF5C3AFA); 

  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // Dark Gray (Headings)
  static const Color textSecondary = Color(0xFF6B7280); // Gray (Body Text)
  static const Color textHint = Color(0xFF9CA3AF); // Light Gray (Placeholder)

  // Status Colors (Tasks, Alerts)
  static const Color success = Color(0xFF10B981); // Green (Completed)
  static const Color warning = Color(0xFFF59E0B); // Yellow (Pending)
  static const Color error = Color(0xFFEF4444); // Red (Overdue)
  static const Color info = Color(0xFF3B82F6); // Blue (Info)

  // Borders & Dividers
  static const Color border = Color(0xFFE5E7EB); // Light Gray Border
  static const Color divider = Color(0xFFD1D5DB); // Slightly Darker Divider}
}