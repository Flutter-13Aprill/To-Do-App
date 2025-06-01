import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static final defalutTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: StyleColor.primaryBlackColor,
      secondary: StyleColor.primaryBlackColor,
    ),
  );

  static final darkTheme = ThemeData(
    // AppBarTheme configuration for black background and white icons
    appBarTheme: const AppBarTheme(
      backgroundColor:
          StyleColor.primaryBlackColor, // Set AppBar background to black
      foregroundColor: StyleColor
          .primaryWhitelColor, // Ensures title text is white (if not explicitly set by titleTextStyle)
      iconTheme: IconThemeData(
        color: StyleColor.primaryWhitelColor,
        fill: 1,
      ), // Sets leading icon (like back button) to white
      actionsIconTheme: IconThemeData(
        color: StyleColor.primaryWhitelColor,
      ), // Sets icons in the actions list to white
      elevation: 0, // No shadow under the AppBar
      centerTitle: true, // Centers the title in the AppBar
      titleTextStyle: TextStyle(
        color: StyleColor.primaryWhitelColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ), // Example title style
    ),

    scaffoldBackgroundColor: StyleColor.primaryBlackColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: StyleColor.primaryWhitelColor,
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        color: StyleColor.primaryWhitelColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleColor.primaryPurpulColor,
        foregroundColor: StyleColor.primaryWhitelColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: StyleColor.primaryWhitelColor,
        side: BorderSide(
          color: StyleColor.primaryPurpulColor,
          width: 1.0, // سمك الحدود
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.zero,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: StyleColor
          .primaryBlack363636Color, // لون خلفية شريط التنقل (كما في الصورة)
      selectedItemColor:
          StyleColor.primaryWhitelColor, // لون العنصر المختار (أيقونة + نص)
      unselectedItemColor:
          StyleColor.primarwhite54Color, // لون العناصر غير المختارة
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed, // لجعل النص والأيقونات مرئية دائمًا
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: StyleColor.primaryPurpulColor, // لون بنفسجي فاتح
      foregroundColor:
          StyleColor.primaryWhitelColor, // لون الأيقونة والنص (إذا كان هناك نص)
      shape: const CircleBorder(), // لجعل الزر دائريًا تمامًا
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF282828),
      hintStyle: TextStyle(
        color: StyleColor.primaryWhitelColor.withOpacity(0.7),
      ),
      labelStyle: TextStyle(
        color: StyleColor.primaryWhitelColor.withOpacity(0.7),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: StyleColor.primaryWhitelColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: StyleColor.primaryWhitelColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: StyleColor.primaryWhitelColor,
          width: 1,
        ),
      ),
      errorStyle: const TextStyle(color: StyleColor.primaryredColor),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: StyleColor.primaryredColor,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: StyleColor.primaryWhitelColor,
          width: 2,
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: StyleColor.primaryBlackColor, // خلفية DatePicker
      headerBackgroundColor: StyleColor.primaryBlackColor, // خلفية رأس الشهر والسنة
      headerForegroundColor: StyleColor.primaryWhitelColor, // لون نص رأس الشهر والسنة
      
      // لون أيام الأسبوع (SUN, MON, TUE, ...) - سيكون أبيض للكل بهذا التعيين
      weekdayStyle: const TextStyle(color: StyleColor.primaryWhitelColor), 
      
      // لون الأرقام داخل التقويم
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryWhitelColor; // لون نص اليوم المختار (يبقى أبيض)
        }
        return StyleColor.primaryWhitelColor; // لون نص الأيام الأخرى (يبقى أبيض)
      }),
      // خلفية الأرقام داخل التقويم
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryPurpulColor; // خلفية اليوم المختار (بنفسجي)
        }
        return Colors.transparent; // خلفية شفافة للأيام غير المختارة
      }),
      
      // لون اليوم الحالي (إذا لم يكن مختارًا)
      todayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryWhitelColor;
        }
        return StyleColor.primaryPurpulColor; // لون نص اليوم الحالي (بنفسجي)
      }),
      todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryPurpulColor;
        }
        return Colors.transparent;
      }),

      // تخصيصات السنوات
      yearForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryWhitelColor;
        }
        return StyleColor.primaryWhitelColor.withOpacity(0.7);
      }),
      yearBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleColor.primaryPurpulColor;
        }
        return Colors.transparent;
      }),
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: StyleColor.primaryPurpulColor),
      confirmButtonStyle: TextButton.styleFrom(foregroundColor: StyleColor.primaryPurpulColor),
    ),

    // تخصيصات TimePickerThemeData العامة
    timePickerTheme: TimePickerThemeData(
      backgroundColor: StyleColor.primaryBlackColor, // لون خلفية الـ Time Picker
      hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? StyleColor.primaryWhitelColor : StyleColor.primaryWhitelColor.withOpacity(0.7)),
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? StyleColor.primaryPurpulColor : Colors.transparent), // لون الدائرة حول الرقم المختار
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? StyleColor.primaryWhitelColor : StyleColor.primaryWhitelColor.withOpacity(0.7)),
      dayPeriodColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? StyleColor.primaryPurpulColor : StyleColor.primaryBlackColor.withOpacity(0.8)), // لون مربع AM/PM
      dialHandColor: StyleColor.primaryPurpulColor, // لون عقرب الساعة
      dialBackgroundColor: StyleColor.primaryBlackColor.withOpacity(0.8), // لون دائرة الساعة/الدقائق
      entryModeIconColor: StyleColor.primaryWhitelColor, // لون أيقونة تبديل الوضع (ساعة/لوحة مفاتيح)
    ),
    
    // ... (بقية خصائص الثيم الأخرى مثل colorScheme و brightness)
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: StyleColor.primaryPurpulColor,
      onPrimary: StyleColor.primaryWhitelColor,
      surface: StyleColor.primaryBlackColor,
      onSurface: StyleColor.primaryWhitelColor,
      secondary: StyleColor.primaryPurpulColor,
      onSecondary: StyleColor.primaryWhitelColor,
    ),
  );
}
