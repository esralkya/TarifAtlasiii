import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF6F61),
      onPrimary: Colors.white,
      secondary: Color(0xFFFFA07A),
      onSecondary: Color(0xFF800000),
      surface: Colors.white,
      onSurface: Color(0xFF800000),
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      titleSmall: GoogleFonts.pattaya(),
      titleMedium: GoogleFonts.roboto(),
      titleLarge: GoogleFonts.pattaya(),
      displayMedium: GoogleFonts.pattaya(),
      displayLarge: GoogleFonts.pattaya(),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFB22222),
      onPrimary: Colors.white,
      secondary: Color(0xFFFF6347),
      onSecondary: Colors.black,
      surface: Color(0xFF2D2D2D),
      onSurface: Colors.white,
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      titleSmall: GoogleFonts.pattaya(),
      titleMedium: GoogleFonts.roboto(),
      titleLarge: GoogleFonts.pattaya(),
      displayMedium: GoogleFonts.pattaya(),
      displayLarge: GoogleFonts.pattaya(),
    ),
  );
}
