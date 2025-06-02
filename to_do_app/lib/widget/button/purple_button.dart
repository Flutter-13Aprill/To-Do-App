import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurpleButton extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final String name;

  const PurpleButton({
    super.key,
    required this.horizontal,
    required this.vertical,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xff8875FF),
      ),
      child: Text(
        name,
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
