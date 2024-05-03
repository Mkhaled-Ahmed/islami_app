import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {

  static const Color blackColor = Color(0xFF242424);
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const yellowColor = Color(0xFFFACC1D);
  static const whiteColor = Colors.white;
  static bool isDarkSelected = true;

  static ThemeData lightTheme = ThemeData(
      dividerColor: lightPrimaryColor,
      primaryColor: lightPrimaryColor,
      brightness: Brightness.light,
      textTheme: TextTheme(
        displaySmall: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
        displayLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor),
        bodyLarge:
            GoogleFonts.elMessiri(fontSize: 30, fontWeight: FontWeight.bold),
        bodyMedium:
            GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w500),
        bodySmall:
            GoogleFonts.elMessiri(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      cardColor: lightPrimaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: lightPrimaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
      ));

  static ThemeData darkTheme = ThemeData(
      dividerColor: yellowColor,
      primaryColor: darkPrimaryColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displaySmall: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        displayLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: yellowColor),
        bodyLarge:
            GoogleFonts.elMessiri(fontSize: 30, fontWeight: FontWeight.bold),
        bodyMedium:
            GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w500),
        bodySmall:
            GoogleFonts.elMessiri(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      cardColor: darkPrimaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: darkPrimaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: darkPrimaryColor),
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)));
}
