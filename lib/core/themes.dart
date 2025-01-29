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
      primary: Color(0xFFfaedcd),
      onPrimary: Color.fromARGB(255, 19, 12, 0),
      secondary: Color.fromARGB(255, 215, 80, 52),
      onSecondary: Color.fromARGB(255, 232, 129, 44),
      surface: Colors.white,
      onSurface: Color(0xFFca6702),
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
      primary: Color(0xFF8B4513),
      onPrimary: Colors.white,
      secondary: Color(0xFFDEB887),
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
