import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/style/app_colors.dart';

class AppTextStyles {
  static var mainText = GoogleFonts.lato(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static var subText = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static var smallText = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static var headerText = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 0.87),
  );
  static var settingSubText = GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(175, 175, 175, 1),
  );
}
