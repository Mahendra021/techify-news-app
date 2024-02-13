import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF181818),
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    color: const Color(0xFF181818),
    elevation: 0,
    titleTextStyle: GoogleFonts.barlow(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 25,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
);
