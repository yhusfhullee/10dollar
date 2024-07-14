import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle body(
      {Color? color,
      double size = 16,
      FontWeight fontWeight = FontWeight.w300}) {
    return GoogleFonts.kreon(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        letterSpacing: 0.1);
  }

  static TextStyle header = GoogleFonts.kreon(
      fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 0.1);
}
