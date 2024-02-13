import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFF3F3F3),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xFFEA8C40),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.white,
    elevation: 0,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.black,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color(0xFFEA8C40),
      textStyle: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color(0xFFEA8C40),
      textStyle: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color(0xFFEA8C40)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: Colors.black,
      textStyle: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF3D3D3D),
      ),
    ),
  ),
  dividerTheme: const DividerThemeData(
    space: 1,
    thickness: 1,
    color: Color(0xFFE8E8E8),
  ),
  appBarTheme: AppBarTheme(
    color: const Color(0xFFF3F3F3),
    elevation: 0,
    titleSpacing: 0,
    titleTextStyle: GoogleFonts.barlow(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF3D3D3D),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 25,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
);
