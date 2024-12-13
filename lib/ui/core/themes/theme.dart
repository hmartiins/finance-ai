import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 16,
      color: AppColors.dark25,
      fontWeight: FontWeight.normal,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light20,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light20,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static final _buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.violet100),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );

  static final _filledButtonThemeData = FilledButtonThemeData(
    style: _buttonStyle,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    filledButtonTheme: _filledButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    fontFamily: GoogleFonts.inter().fontFamily,
    extensions: [],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    fontFamily: GoogleFonts.inter().fontFamily,
    extensions: [],
  );
}
