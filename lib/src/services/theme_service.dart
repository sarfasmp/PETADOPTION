import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeToggle {
  static dark() {
    return ThemeData(
      textTheme: TextTheme(
        //Bold
        headline4: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),

        //SemiBOld
        headline3: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),

        //Medium
        headline2: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        //regular
        headline1: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),

      appBarTheme: const AppBarTheme(
        color: Color(0xff4E4E4E),
      ),
      cardColor: const Color(0xff4E4E4E),

      shadowColor: Colors.grey[700],
      // backgroundColor: Colors.red,


      indicatorColor: Colors.orange,

      buttonColor: const Color(0xffFBB827),

      //const Color(0xffFBB827),

      scaffoldBackgroundColor: const Color(0xff5F605F),
      brightness: Brightness.dark,
    );
  }

  static light() {
    return ThemeData(
      textTheme: TextTheme(
        headline5: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),

        //Bold
        headline4: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),

        //SemiBOld
        headline3: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),

        //Medium
        headline2: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        //regular
        headline1: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),

      shadowColor: Colors.grey[300]!,

      indicatorColor: Colors.orange,


      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.white),
      brightness: Brightness.light,
    );
  }
}

Color redColor = const Color(0xfff5babf);
Color darkRedColor = const Color(0xffab3943);
