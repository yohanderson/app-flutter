import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
    primaryColor: Colors.indigoAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.indigoAccent,
    ),
    textTheme: textTheme,
  );

  static TextTheme get textTheme {
    return TextTheme(
      caption: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.montserrat(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ),
      headline1: GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}