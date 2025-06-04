import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class TextStyles {
  static final lato70032 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: AppPalette.primaryTextColor,
  );
  
  static final lato60024 = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: AppPalette.primaryTextColor,
  );

  static final lato40018 = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppPalette.primaryTextColor,
  );

  static final lato40014 = GoogleFonts.lato(
    color: Color(0xff656565),
    fontWeight: FontWeight.w400,
    fontSize: 14
  );

  static final lato50020 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppPalette.primaryTextColor,
  );
}
