import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFF242424);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color yellowColor = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: Colors.black54,
          secondary: blackColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primary,
          onBackground: Colors.grey,
          surface: Colors.blueGrey,
          onSurface: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: blackColor),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 30, color: blackColor, fontWeight: FontWeight.bold),
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w100),
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25, color: blackColor, fontWeight: FontWeight.w700)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          backgroundColor: primary,
          selectedItemColor: blackColor,
          unselectedItemColor: Colors.white));
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: darkPrimary,
          onPrimary: Colors.white,
          secondary: yellowColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: yellowColor,
          onBackground: Colors.grey,
          surface: Colors.blueGrey,
          onSurface: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20, color: yellowColor, fontWeight: FontWeight.w100),
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          backgroundColor: darkPrimary,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white));
}
